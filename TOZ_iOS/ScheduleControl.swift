//
//  ScheduleControl.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class ScheduleControl: UIControl {

    @IBOutlet var view: UIView!
    @IBOutlet weak var scheduleLabel: UILabel!

    var scheduleSelected: Bool = false {
        didSet {
            if scheduleSelected {
                scheduleLabel.layer.backgroundColor = UIColor.lightGray.cgColor
                scheduleLabel.textColor = UIColor.darkText
            } else {
                scheduleLabel.layer.backgroundColor = UIColor.white.cgColor
                scheduleLabel.textColor = UIColor.white
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        Bundle.main.loadNibNamed("ScheduleControl", owner: self, options: nil)
        addSubview(view)

        scheduleLabel.layer.borderWidth = 1
        scheduleLabel.layer.borderColor = UIColor.gray.cgColor

        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        view.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }

    override func layoutSubviews() {
        scheduleLabel.layer.cornerRadius = scheduleLabel.bounds.height * 0.5
    }

}
