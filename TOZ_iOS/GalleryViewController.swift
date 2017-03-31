//
//  GalleryViewController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController {
    @IBOutlet weak var galleryLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        getListOfAnimals()
    }

    let listOfAnimalsOperation = ListOfAnimalsOperation()

    // Just to check if list of animals was retrieved from server
    func getListOfAnimals() {
        listOfAnimalsOperation.resultCompletion = { result in
            let numberOfAnimals: String
            var firstAnimalName: String = "?"
            var firstAnimalType: String = "unknown"

            switch result {
            case .success(let listOfAnimals):
                numberOfAnimals = String(listOfAnimals.count)
                if let firstAnimal = listOfAnimals[0] {
                    firstAnimalName = firstAnimal.name
                    firstAnimalType = firstAnimal.type
                }
            case .failure(let error):
                numberOfAnimals = "\(error)"
            }

            DispatchQueue.main.async {
                self.galleryLabel.text = "We take care for \(numberOfAnimals) animals right now.\n\nFirst one is a \(firstAnimalType) named \(firstAnimalName)."
            }
        }
        listOfAnimalsOperation.start()
    }
}
