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

    var animalsArray = [AnimalItem]() {
        didSet {
            self.galleryTableView.reloadData()
        }
    }

    var selectedGalleryCellID: String?
    @IBOutlet weak var imageView: UIImageView!
    //@IBOutlet weak var indicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getListOfAnimals()
    }

    // UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animalsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "galleryTableViewCell", for: indexPath)
        if let cell = cell as? GalleryTableViewCell {
            cell.configure(for: animalsArray[indexPath.row])
        }
        return cell
    }

    // UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = animalsArray[indexPath.row]
        selectedGalleryCellID = selectedCell.animalID
        performSegue(withIdentifier: "showGalleryDetail", sender: selectedGalleryCellID)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showGalleryDetail" {
            let galleryDetailViewController = segue.destination as? GalleryDetailViewController
            galleryDetailViewController?.selectedCellID = selectedGalleryCellID
        }
    }

    let listOfAnimalsOperation = ListOfAnimalsOperation()
    func getListOfAnimals() {
        listOfAnimalsOperation.resultCompletion = { result in
            switch result {
            case .success(let listOfAnimals):
                DispatchQueue.main.async {
                    self.animalsArray = listOfAnimals
                }
            case .failure(let error):
                print ("\(error)")
            }
        }
            listOfAnimalsOperation.start()
        }
    }
