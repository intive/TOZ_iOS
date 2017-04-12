//
//  ScheduleView.swift
//  TOZ_iOS
//
//  Created by RKB on 31/03/2017.
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class ScheduleView: UIControl {

    @IBOutlet var sView: UIView!
    @IBOutlet weak var switchControl: UIButton!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
       Bundle.main.loadNibNamed("Schedule", owner: self, options: nil)
        switchControl.layer.cornerRadius = switchControl.bounds.height * 0.35
        switchControl.layer.borderWidth = 1
        switchControl.layer.borderColor = UIColor.white.cgColor

        self.sView.frame = self.bounds
        if let titleLabel = switchControl.titleLabel {
            titleLabel.font = UIFont(name: titleLabel.font.fontName, size: 8)
        }
        self.addSubview(self.sView)

    }

}
