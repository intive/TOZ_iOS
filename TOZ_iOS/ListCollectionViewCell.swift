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
    var dayChoice: UIButton!
    var stackView: UIStackView!

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.backgroundColor = UIColor.yellow
        //stackView = UIStackView()
        stackView = UIStackView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 1
        //stackView.translatesAutoresizingMaskIntoConstraints = false
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
        dayChoice = UIButton()
        dayChoice.setTitleColor(UIColor.blue, for: .normal)

        stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(foreNameLabel)
        stackView.addArrangedSubview(surNameLabel)
        stackView.addArrangedSubview(dayChoice)
        //self.addSubview(dateLabel)
        //self.addSubview(daySwitch)

        dayChoice.addTarget(self, action: Selector(("tappedDay:")), for: .touchUpInside)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func OnCell(display reservation: ReservationItem) {
        //aaa()

        dateLabel.text = WeekdayItem(from: reservation.date).dataLabel
        foreNameLabel.text = reservation.ownerForename
        surNameLabel.text = reservation.ownerSurname
        if reservation.timeOfDay == .morning {
            dayChoice.setTitle("Rano", for: .normal)
        } else {
            dayChoice.setTitle("Popołudniu", for: .normal)
        }
    }

    func tappedDay(sender: UIButton!) {
        print("Tapped: \(sender)")
    }
}
