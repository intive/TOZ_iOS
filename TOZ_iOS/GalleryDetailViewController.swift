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
    @IBOutlet weak var animalDescription: UITextView!
    @IBOutlet weak var pictureCaption: UILabel!
    @IBOutlet weak var photosContainer: UIView!

    var selectedCellID: String?
    var photoURL: URL?
    var photos: [URL] = []
    var animalOperation: AnimalOperation?
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
        NotificationCenter.default.addObserver(forName: .pictureChanged, object: nil, queue: nil, using: updateCaption)
    }

    func getAnimal() {
        animalOperation?.resultCompletion = { result in
            switch result {
            case .success(let localAnimal):
                DispatchQueue.main.async {
                    self.animalName.text = localAnimal.name
                    self.animalType.text = localAnimal.type
                    self.galleryDetailPhotoViewController?.animalType = localAnimal.type
                    self.animalSex.text = localAnimal.sex
                    self.animalDescription.text = localAnimal.description
                    // For now if there is a imageURL for the Animal than add it to array of photos.
                    // To be changed when backend starts to return array of urls instead of just one url.
                    if let photoURL = localAnimal.imageUrl {
                        self.photos.append(photoURL)
                        self.pictureCaption.text = "Zdjęcie 1 / \(self.photos.count)"
                    } else {
                        self.pictureCaption.text = "Brak zdjęcia"
                    }
                    self.galleryDetailPhotoViewController?.photos = self.photos
                }
            case .failure(let error):
                print ("\(error)")
            }
        }
        animalOperation?.start()
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
