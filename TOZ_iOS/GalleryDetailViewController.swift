//
//  GalleryDetailViewController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit
import Foundation

class GalleryDetailViewController: UIViewController {

    @IBOutlet weak var animalName: UILabel!
    @IBOutlet weak var animalType: UILabel!
    @IBOutlet weak var animalSex: UILabel!
    @IBOutlet weak var animalDescription: UILabel!
    @IBOutlet weak var pictureCaption: UILabel!
    @IBOutlet weak var photosContainer: UIView!
    @IBOutlet weak var helpAnimalLabel: UILabel!
    @IBOutlet weak var helpAnimalAccount: UILabel!
    @IBOutlet weak var helpAnimalView: UIView!
    @IBOutlet weak var helpThisAnimalButton: Button!
    @IBOutlet weak var animalDescriptionDivider: UIView!

    var selectedCellID: String?
    var photoURL: URL?
    var photos: [URL] = []
    var animalOperation: AnimalOperation?
    var organizationInfoOperation = OrganizationInfoOperation()
    var galleryDetailPhotoViewController: GalleryDetailPhotoViewController?

    func makeAnimalOperation() {
        if let selectedCellID = selectedCellID {
            animalOperation = AnimalOperation(animalID: selectedCellID)
        } else {
            animalOperation = nil
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.helpAnimalLabel.text = "Jeżeli chcesz pomóc temu zwierzakowi wyślij przelew na podany numer konta w tytule wpisując jego imię"
        isHelpViewHidden(hidden: true)
        galleryDetailPhotoViewController = storyboard?.instantiateViewController(withIdentifier: "GalleryDetailPhotoViewController") as? GalleryDetailPhotoViewController
        if let galleryDetailPhotoViewController = galleryDetailPhotoViewController {
            addChildViewController(galleryDetailPhotoViewController)
            galleryDetailPhotoViewController.view.translatesAutoresizingMaskIntoConstraints = false
            photosContainer.addSubview(galleryDetailPhotoViewController.view)
            NSLayoutConstraint.activate([
                galleryDetailPhotoViewController.view.leadingAnchor.constraint(equalTo: photosContainer.leadingAnchor),
                galleryDetailPhotoViewController.view.trailingAnchor.constraint(equalTo: photosContainer.trailingAnchor),
                galleryDetailPhotoViewController.view.topAnchor.constraint(equalTo: photosContainer.topAnchor),
                galleryDetailPhotoViewController.view.bottomAnchor.constraint(equalTo: photosContainer.bottomAnchor)
                ])
            galleryDetailPhotoViewController.didMove(toParentViewController: self)
        }
        makeAnimalOperation()
        getAnimal()
        getOrganizationInfo()
        _ = NotificationCenter.default.addObserver(forName: .pictureChanged, object: nil, queue: nil, using: updateCaption)
    }

    @IBAction func helpThisAnimalAction(_ sender: Any) {
        isHelpViewHidden(hidden: helpViewHeight == nil)
    }
    var helpViewHeight: NSLayoutConstraint?

    func isHelpViewHidden(hidden: Bool) {
        if hidden == true {
            helpViewHeight = NSLayoutConstraint(item: helpAnimalView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 0)
            if let helpViewHeight = helpViewHeight {
                self.view.addConstraint(helpViewHeight)
                helpViewHeight.isActive = true
                self.helpThisAnimalButton.backgroundColor = Color.Cell.Button.primary

            }
        } else {
            if let helpViewHeight = helpViewHeight {
                helpViewHeight.isActive = false
                self.helpViewHeight = nil
                self.helpThisAnimalButton.backgroundColor = Color.Cell.Button.pressed
            }
        }
    }

    func getAnimal() {
        animalOperation?.resultCompletion = { result in
            switch result {
            case .success(let localAnimal):
                DispatchQueue.main.async {
                    self.animalName.text = localAnimal.name
                    self.helpAnimalLabel.text = "Jeżeli chcesz pomóc temu zwierzakowi wyślij przelew na podany numer konta w tytule wpisując \"\(localAnimal.name)\""
                    self.navigationItem.title = localAnimal.name
                    self.animalType.text = localAnimal.type.localizedType
                    self.galleryDetailPhotoViewController?.animalType = localAnimal.type
                    self.animalSex.text = localAnimal.sex.localizedSex
                    if let localAnimalDescription = localAnimal.description {
                        self.animalDescription.text = localAnimalDescription
                    } else {
                        self.animalDescriptionDivider.layer.isHidden = true
                    }
                    // If there is an imageURL for the Animal than add it to array of photos.
                    if let photoURL = localAnimal.imageUrl {
                        self.photos.append(photoURL)
                        self.pictureCaption.text = "Zdjęcie 1 / \(self.photos.count)"
                    } else {
                        self.pictureCaption.text = "Brak zdjęcia"
                    }
                    // If there is a nonempty gallery, than overwrite 'photos' with it
                    if let galleryURLs = localAnimal.galleryURLs {
                        if !galleryURLs.isEmpty {
                            self.photos = galleryURLs
                        }
                    }
                    self.galleryDetailPhotoViewController?.photos = self.photos
                }
            case .failure(let error):
                print ("\(error)")

            }
        }
        animalOperation?.start()
    }

    func getOrganizationInfo() {
        organizationInfoOperation.resultCompletion = { result in
            switch result {
            case .success (let organizationInfo):
                DispatchQueue.main.async {
                    self.helpAnimalAccount.text = organizationInfo.accountNumber
                }
            case .failure(let error):
                print ("\(error)")
            }
        }
        organizationInfoOperation.start()

    }

    func updateCaption(notification: Notification) {
        guard let index = notification.userInfo?["index"] else { return }
        if photos.count > 0 {
            self.pictureCaption.text = "Zdjęcie \(index) / \(photos.count)"
        } else {
            self.pictureCaption.text = "Brak zdjęcia"
        }
    }

}
