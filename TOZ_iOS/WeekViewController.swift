//
//  WeekViewController.swift
//  TOZ_iOS
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class WeekViewController: UIViewController {

    @IBAction func aha(_ sender: Any) {
    }
    @IBAction func weekAction(_ sender: WeekDayView) {
        let tag = sender.tag
        for button in weekDayViews {
            if tag == button.tag {
                weekDayViews[tag].valueOfDay.backgroundColor = UIColor.white
                weekDayViews[tag].valueOfDay.setTitleColor(UIColor.darkGray, for: .normal)
            } else {
                weekDayViews[tag].valueOfDay.backgroundColor = UIColor.darkGray
                weekDayViews[tag].valueOfDay.setTitleColor(UIColor.white, for: .normal)
            }
        }
    }
    @IBOutlet var weekDayViews: [WeekDayView]!

    @IBOutlet var weekView: UIControl!

    @IBOutlet weak var calendarStack: UIStackView!

    @IBOutlet weak var scheduleMorning: UIStackView!

    @IBOutlet weak var scheduleAfternoon: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        }
}
