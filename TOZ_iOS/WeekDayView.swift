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

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        Bundle.main.loadNibNamed("WeekDayView", owner: self, options: nil)

        self.view.frame = self.bounds
        self.addSubview(self.view)
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        dayOfWeek.textColor = UIColor.lightGray
        valueOfDay.layer.cornerRadius = valueOfDay.bounds.height * 0.35
        valueOfDay.layer.borderWidth = 1
        valueOfDay.layer.borderColor = UIColor.white.cgColor
        valueOfDay.textColor = UIColor.darkGray

        isOff()
    }

    func isOn() {
        valueOfDay.layer.borderColor = UIColor.lightGray.cgColor
    }

    func isOff() {
        valueOfDay.layer.borderColor = UIColor.white.cgColor
    }
}
