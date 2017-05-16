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
    @IBOutlet weak var animalCreationDate: UILabel!
    @IBOutlet weak var animalDescription: UITextView!
    @IBOutlet weak var pictureCaption: UILabel!

    var selectedCellID: String?
    var photoURL: URL?
    var photos: [URL] = []
    var animalOperation: AnimalOperation?

    func makeAnimalOperation() {
        if let selectedCellID = selectedCellID {
            animalOperation = AnimalOperation(animalID: selectedCellID)
        } else {
            animalOperation = nil
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
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
                    self.animalSex.text = localAnimal.sex
                    self.animalCreationDate.text = localAnimal.created?.dateToFormattedString()
                    self.animalDescription.text = localAnimal.description
                    // For now if there is a imageURL for the Animal than add it to array of photos.
                    // To be changed when backend starts to return array of urls instead of just one url.
//                    if let photoURL = localAnimal.imageUrl {
//                        self.photos.append(photoURL)
//                    }

                    // Add URL to random photo just to check if it is passed
                    // forward to GalleryDetailPhotoViewController:
                    self.photos.append(URL(string: "https://placeimg.com/640/480/animals")!)

                    self.pictureCaption.text = "Zdjęcie 1 / \(self.photos.count)"
                }
            case .failure(let error):
                print ("\(error)")
            }
        }
        animalOperation?.start()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "profilePhotoSegue" {
            let galleryDetailPhotoViewController = segue.destination as? GalleryDetailPhotoViewController
            galleryDetailPhotoViewController?.photos = photos
        }
    }

    func updateCaption(notification: Notification) {
        guard let index = notification.userInfo!["index"] else { return }
        self.pictureCaption.text = "Zdjęcie \(index) / \(photos.count)"
    }
}
