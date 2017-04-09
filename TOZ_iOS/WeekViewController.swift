//
//  WeekViewController.swift
//  TOZ_iOS
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class WeekViewController: UIViewController {

    @IBAction func weekAction(_ sender: WeekDayView) {
        print("weekAction")

        let tag = sender.tag
        for button in weekDayViews {
            if tag == button.tag {
                weekDayViews[tag].valueOfDay.backgroundColor = UIColor.white
                weekDayViews[tag].valueOfDay.setTitleColor(UIColor.darkGray, for: .normal)
            } else {
                weekDayViews[tag].valueOfDay.backgroundColor = UIColor.lightGray
                weekDayViews[tag].valueOfDay.setTitleColor(UIColor.white, for: .normal)
            }
        }
    }

    @IBAction func scheduleMorningAction(_ sender: ScheduleView) {
        print(scheduleMoringViews.count)
        print(scheduleMoringViews[1].tag)
        print("scheduleMorningAction")
    }
//scheduleAfterAction
    @IBAction func scheduleAfterAction(_ sender: ScheduleView) {
    }

    @IBOutlet var weekDayViews: [WeekDayView]!

    @IBOutlet var scheduleMoringViews: [ScheduleView]!

    @IBOutlet var scheduleAfterViews: [ScheduleView]!

    @IBOutlet var weekView: UIControl!

    @IBOutlet weak var calendarStack: UIStackView!

    @IBOutlet weak var scheduleMorning: UIStackView!

    @IBOutlet weak var scheduleAfternoon: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        }
}
