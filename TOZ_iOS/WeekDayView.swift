//
//  WeekDayView.swift
//  TOZ_iOS
//
//  Created by RKB on 31/03/2017.
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class WeekDayView: UIControl {

    @IBOutlet var view: UIView!
    @IBOutlet weak var dayOfweek: UILabel!
    @IBOutlet weak var valueOfDay: UIButton!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        Bundle.main.loadNibNamed("WeekDay", owner: self, options: nil)
        self.view.frame = self.bounds
        if let titleLabel = valueOfDay.titleLabel {
            titleLabel.font = UIFont(name: titleLabel.font.fontName, size: 8)
        }
        valueOfDay.layer.cornerRadius = dayOfweek.bounds.height * 0.35
        valueOfDay.layer.borderWidth = 1
        valueOfDay.layer.borderColor = UIColor.white.cgColor
        dayOfweek.textColor = UIColor.lightGray
        valueOfDay.setTitleColor(UIColor.lightGray, for: .normal)

        self.view.frame = self.bounds
        self.addSubview(self.view)
    }
}
