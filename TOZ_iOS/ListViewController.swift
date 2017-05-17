//
//  ListViewController.swift
//  TOZ_iOS
//
//  Created by RKB on 14/05/2017.
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    var collectionView: ListUICollectionView!
    let identifierCell = "Cell"
    let identifierHeader = "HeaderView"

    var reservations: [ReservationItem] = [ReservationItem(idObject: "111", date: Date(), timeOfDay: .morning, ownerSurname: "Adam", ownerForename: "Borowy")]
    var headerNames: [String] = ["Morning", "Afternoon"]

    override func viewDidLoad() {
        super.viewDidLoad()

        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 90, height: 120)
        collectionView = ListUICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ListCollectionViewCell.self, forCellWithReuseIdentifier: identifierCell)
        collectionView.register(ListHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: identifierHeader)
        
        collectionView.backgroundColor = UIColor.white
        self.view.addSubview(collectionView)
    }

}

extension ListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //
        return reservations.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifierCell, for: indexPath)
        if let cell = cell as? ListCollectionViewCell {
            cell.OnCell(display: reservations[0])
        }

        cell.backgroundColor = UIColor.orange
        return cell

    }

    func collectionView(_ collectionView: UICollectionView,
                                 viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        // swiftlint:disable:next force_cast
        let headerInList: ListHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: identifierHeader, for: indexPath) as! ListHeaderView

        headerInList.sectionLabel.text = headerNames[indexPath.section]

        print("SSFSFS")
        return headerInList
    }
    
}
