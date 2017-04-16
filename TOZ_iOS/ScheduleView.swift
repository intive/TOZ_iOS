//
//  ScheduleView.swift
//  TOZ_iOS
//
//  Created by RKB on 31/03/2017.
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class ScheduleView: UIControl {

    @IBOutlet var view: UIView!
    @IBOutlet weak var switchControl: UILabel!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
       Bundle.main.loadNibNamed("ScheduleView", owner: self, options: nil)

        self.view.frame = self.bounds
        self.addSubview(self.view)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        switchControl.layer.cornerRadius = switchControl.bounds.height * 0.3
        switchControl.layer.borderWidth = 1
        switchControl.layer.borderColor = UIColor.gray.cgColor
        switchControl.layer.backgroundColor = UIColor.white.cgColor
        switchControl.textColor = UIColor.white

    }

    func isOn() {
        switchControl.layer.backgroundColor = UIColor.lightGray.cgColor
        switchControl.textColor = UIColor.darkText
    }

    func isOff() {
        switchControl.layer.backgroundColor = UIColor.white.cgColor
        switchControl.textColor = UIColor.white
    }
}
