//
//  GalleryViewController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit
import Foundation

class GalleryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var galleryTableView: UITableView!
    @IBOutlet weak var temporaryName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func unwindToGallery(segue: UIStoryboardSegue) {
    }
    //@IBOutlet weak var indicator: UIActivityIndicatorView!
    var animalsArray = [GalleryEntity]()
    override func viewDidLoad() {
        super.viewDidLoad()
//        getListOfAnimals()
        let firstAnimal = GalleryEntity(name: "Piorun", type: "Golden Retriever", image: UIImage(named: "dog1"))
        let secondAnimal = GalleryEntity(name: "Asti", type: "Beagle", image: UIImage(named: "dog2"))
        let thirdAnimal = GalleryEntity(name: "Lola", type: "Owczarek", image: UIImage(named: "dog3"))
        animalsArray = [firstAnimal, secondAnimal, thirdAnimal]
//        temporaryName.text = "TOZ Szczecin"
    }
    // UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animalsArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "galleryTableViewCell", for: indexPath)
        if let cell = cell as? GalleryTableViewCell {
            let animalInfo = animalsArray[indexPath.row]
            cell.animalName.text = animalInfo.name
            cell.animalType.text = animalInfo.type
            cell.animalImage.image = animalInfo.image
        }
        return cell
    }

    // UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showGalleryDetail", sender: self)
    }

    let listOfAnimalsOperation = ListOfAnimalsOperation()

//    func getListOfAnimals() {
//        listOfAnimalsOperation.resultCompletion = { result in
//            switch result {
//            case .success(let listOfAnimals): break
//            case .failure(let error): break
//            }
//            DispatchQueue.main.async {
//                // Do something
//            }
//        }
//        listOfAnimalsOperation.start()
//    }
}
