//
//  WeekDayControl.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class WeekDayControl: UIControl {

    @IBOutlet var view: UIView!
    @IBOutlet weak var dayOfWeekLabel: UILabel!
    @IBOutlet weak var valueOfDayLabel: UILabel!

    var weekdaySelected: Bool = false {
        didSet {
            if weekdaySelected {
                valueOfDayLabel.layer.borderColor = UIColor.lightGray.cgColor

            } else {
                valueOfDayLabel.layer.borderColor = UIColor.white.cgColor
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        Bundle.main.loadNibNamed("WeekDayControl", owner: self, options: nil)
        addSubview(view)
        
        valueOfDayLabel.layer.borderWidth = 1
        valueOfDayLabel.textColor = UIColor.darkGray
        valueOfDayLabel.layer.borderColor = UIColor.white.cgColor

        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        view.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }

    override func layoutSubviews() {
        dayOfWeekLabel.textColor = UIColor.lightGray
        valueOfDayLabel.layer.cornerRadius = valueOfDayLabel.bounds.height * 0.5
    }

}
