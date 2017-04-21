//
//  WeekDayView.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class WeekDayView: UIControl {

    @IBOutlet var view: UIView!
    @IBOutlet weak var dayOfWeek: UILabel!
    @IBOutlet weak var valueOfDay: UILabel!

    var weekdayEnable: Bool = false {
        didSet {
            if weekdayEnable {
                valueOfDay.layer.borderColor = UIColor.lightGray.cgColor

            } else {
                valueOfDay.layer.borderColor = UIColor.white.cgColor
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        Bundle.main.loadNibNamed("WeekDayView", owner: self, options: nil)

        self.view.frame = self.bounds
        self.addSubview(self.view)
    }

    override func layoutSubviews() {
        dayOfWeek.textColor = UIColor.lightGray
        valueOfDay.layer.cornerRadius = valueOfDay.bounds.height * 0.5
        valueOfDay.layer.borderWidth = 1
        valueOfDay.textColor = UIColor.darkGray
        weekdayEnable = false
    }

}
