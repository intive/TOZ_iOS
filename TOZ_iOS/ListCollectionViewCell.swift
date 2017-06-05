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
    var foreNameLabel: UILabel!
    var surNameLabel: UILabel!
    var dayChoice: UILabel!
    var stackView: UIStackView!

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.backgroundColor = UIColor.yellow
        stackView = UIStackView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 4
        self.addSubview(stackView)

        dateLabel = UILabel()
        dateLabel.adjustsFontSizeToFitWidth = true
        dateLabel.textColor = UIColor.darkGray
        dateLabel.backgroundColor = UIColor.orange
        foreNameLabel = UILabel()
        foreNameLabel.adjustsFontSizeToFitWidth = true
        foreNameLabel.textColor = UIColor.darkGray
        foreNameLabel.backgroundColor = UIColor.blue
        surNameLabel = UILabel()
        surNameLabel.adjustsFontSizeToFitWidth = true
        surNameLabel.textColor = UIColor.darkGray
        surNameLabel.backgroundColor = UIColor.purple
        dayChoice = UILabel()
        dayChoice.backgroundColor = UIColor.blue

        stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(foreNameLabel)
        stackView.addArrangedSubview(surNameLabel)
        stackView.addArrangedSubview(dayChoice)

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func OnCell(display reservation: ReservationItem) {
        dateLabel.text = WeekdayItem(from: reservation.date).dataLabel
        foreNameLabel.text = reservation.ownerForename
        surNameLabel.text = reservation.ownerSurname
        if reservation.timeOfDay == .morning {
            dayChoice.text = "Rano"
        } else {
            dayChoice.text = "Popołudniu"
        }
    }

}
