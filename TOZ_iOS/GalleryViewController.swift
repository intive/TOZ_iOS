//
//  GalleryViewController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var galleryTableView: UITableView!
    @IBOutlet weak var temporaryName: UILabel!
    
    var animalsArray:[GalleryEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstAnimal = GalleryEntity(name: "Piorun", age: "3 lata", description: "Dog ipsum dolor sit amet, consectetur adipiscing elit. Proin nibh augue, suscipit a, scelerisque sed, lacinia in, mi. Cras vel lorem. Etiam pellentesque aliquet tellus. Phasellus pharetra nulla ac diam. Quisque semper justo at risus.", image: UIImage(named: "dog1"))
        let secondAnimal = GalleryEntity(name: "Asti", age: "5 lat", description: "Dog ipsum dolor sit amet, consectetur adipiscing elit. Proin nibh augue, suscipit a, scelerisque sed, lacinia in, mi. Cras vel lorem. Etiam pellentesque aliquet tellus.", image: UIImage(named: "dog2"))
        let thirdAnimal = GalleryEntity(name: "Lola", age: "4 lata", description: "Dog ipsum dolor sit amet, consectetur adipiscing elit. Proin nibh augue, suscipit a, scelerisque sed, lacinia in, mi. Cras vel lorem. Etiam pellentesque aliquet tellus. Phasellus pharetra nulla ac diam. Quisque semper justo at risus. Donec venenatis, turpis vel hendrerit interdum, dui ligula ultricies.", image: UIImage(named: "dog3"))
        
        animalsArray = [firstAnimal, secondAnimal, thirdAnimal]
        
        temporaryName.text = "TOZ Szczecin"
    }
    
    // UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animalsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let galleryCell: GalleryTableViewCell = tableView.dequeueReusableCell(withIdentifier: "galleryTableViewCell") as! GalleryTableViewCell
        
        let animalInfo = animalsArray[indexPath.row]
        
        galleryCell.animalDescription.text = animalInfo.description
        galleryCell.animalName.text = animalInfo.name
        galleryCell.animalAge.text = animalInfo.age
        galleryCell.animalImage.image = animalInfo.image
        return galleryCell
    }
    
    // UITableViewDelegate
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
    
    
    
}
