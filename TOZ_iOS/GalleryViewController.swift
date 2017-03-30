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

            switch result {
            case .success(let listOfAnimals):
                numberOfAnimals = String(listOfAnimals.count)
            case .failure(let error):
                numberOfAnimals = "\(error)"
            }

            DispatchQueue.main.async {
                self.galleryLabel.text = "There are currently \(numberOfAnimals) animals in our database."
            }
        }
        listOfAnimalsOperation.start()
    }
}
