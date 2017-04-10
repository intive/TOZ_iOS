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

    var animalID: String = ""
    
    let animalOperation = AnimalOperation(animalID: animalID)

    override func viewDidLoad() {
        super.viewDidLoad()
        getAnimal()

    }

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
