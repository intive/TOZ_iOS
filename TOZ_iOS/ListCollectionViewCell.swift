//
//  ListCollectionViewCell.swift
//  TOZ_iOS
//
//  Created by RKB on 14/05/2017.
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {

    var dateLabel: UILabel!
    var daySwitch: UISwitch!
    //var daySwitch2: UI!

    func loadView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        self.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        self.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }

    func OnCell(display reservation: ReservationItem) {
        //aaa()
        dateLabel = UILabel()
        dateLabel.frame = self.frame
        dateLabel.textColor = UIColor.darkGray
        dateLabel.backgroundColor = UIColor.white
        dateLabel.text = reservation.ownerForename
        self.addSubview(dateLabel)

        daySwitch = UISwitch()
        //daySwitch.
        self.addSubview(daySwitch)

    }
}
