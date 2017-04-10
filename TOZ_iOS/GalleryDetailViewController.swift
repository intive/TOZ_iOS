//
//  GalleryDetailViewController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit
import Foundation

let animalID = "45eb78b5-6a4d-41cc-9bf9-52b09fe20c95"

class GalleryDetailViewController: UIViewController {

    @IBOutlet weak var animalName: UILabel!
    @IBOutlet weak var animalType: UILabel!
    @IBOutlet weak var animalSex: UILabel!
    @IBOutlet weak var animalCreationDate: UILabel!
    @IBOutlet weak var animalDescription: UITextView!

    var selectedCell: String?
    let animalOperation = AnimalOperation(animalID: selectedCell)

    override func viewDidLoad() {
        super.viewDidLoad()
        getAnimal()

    }

//    func getAnimal() {
//                    self.animalName.text = selectedCell?.animalName.text
//                    self.animalType.text = selectedCell?.animalType.text
//                    self.animalSex.text = selectedCell?.animalSex.text
//                    self.animalCreationDate.text = String(describing: selectedCell?.animalCreated.text)
//                    self.animalDescription.text = selectedCell?.animalDescription.text
//        }
    func getAnimal() {
        animalOperation.resultCompletion = { result in
            switch result {
            case .success(let localAnimal):
                DispatchQueue.main.async {
                    self.animalName.text = localAnimal.name
                    self.animalType.text = localAnimal.type
                    self.animalSex.text = localAnimal.sex
                    self.animalCreationDate.text = String(describing: localAnimal.created)
                    self.animalDescription.text = localAnimal.description
                }
            case .failure(let error):
                print ("\(error)")
            }
        }
        animalOperation.start()
    }

}
