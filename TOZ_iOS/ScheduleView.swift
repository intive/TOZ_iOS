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

    func scheduleTap() {
        let alertController = UIAlertController(title: "Dos†ępność terminu", message:
            "Tak/Nie", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
       Bundle.main.loadNibNamed("Schedule", owner: self, options: nil)
        switchControl.layer.cornerRadius = 0.5 * switchControl.bounds.size.width

        self.sView.frame = self.bounds
        if let titleLabel = switchControl.titleLabel {
            titleLabel.font = UIFont(name: titleLabel.font.fontName, size: 8)
        }
        self.addSubview(self.sView)

    }

}
