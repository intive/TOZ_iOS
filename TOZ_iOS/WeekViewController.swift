//
//  WeekViewController.swift
//  TOZ_iOS
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class WeekViewController: UIViewController {

    var delegate: CalendarViewController!

    @IBAction func weekAction(_ sender: WeekDayView) {
        let tag = sender.tag
        if tag != delegate.indexDay {
            print(tag)
            print(delegate.indexDay)
            weekDayViews[delegate.indexDay].valueOfDay.backgroundColor = UIColor.lightGray
            weekDayViews[delegate.indexDay].valueOfDay.setTitleColor(UIColor.white, for: .normal)
            weekDayViews[tag].valueOfDay.backgroundColor = UIColor.white
            weekDayViews[tag].valueOfDay.setTitleColor(UIColor.lightGray, for: .normal)
            delegate.indexDay = tag
        }
    }

    @IBAction func scheduleMorningAction(_ sender: ScheduleView) {
        let tag = sender.tag
        if tag == delegate.indexDay {
            if scheduleMoringViews[delegate.indexDay].switchControl.title(for: .normal) == nil {
                print("make reservation")
                scheduleMoringViews[delegate.indexDay].switchControl.setTitle("RK", for: .normal)
                scheduleMoringViews[delegate.indexDay].switchControl.setTitleColor(UIColor.white, for: .normal)
                scheduleMoringViews[delegate.indexDay].switchControl.backgroundColor = UIColor.lightGray
            } else {
                print("delete reservation")
                scheduleMoringViews[delegate.indexDay].switchControl.setTitle(nil, for: .normal)
                scheduleMoringViews[delegate.indexDay].switchControl.setTitleColor(UIColor.lightGray, for: .normal)
                scheduleMoringViews[delegate.indexDay].switchControl.backgroundColor = UIColor.white
            }
        }
    }

    @IBAction func scheduleAfterAction(_ sender: ScheduleView) {
        let tag = sender.tag
        if tag == delegate.indexDay {
            if scheduleAfterViews[delegate.indexDay].switchControl.title(for: .normal) == nil {
                print("make reservation")
                scheduleAfterViews[delegate.indexDay].switchControl.setTitle("RK", for: .normal)
                scheduleAfterViews[delegate.indexDay].switchControl.setTitleColor(UIColor.white, for: .normal)
                scheduleAfterViews[delegate.indexDay].switchControl.backgroundColor = UIColor.lightGray
            } else {
                print("delete reservation")
                scheduleAfterViews[delegate.indexDay].switchControl.setTitle(nil, for: .normal)
                scheduleAfterViews[delegate.indexDay].switchControl.setTitleColor(UIColor.lightGray, for: .normal)
                scheduleAfterViews[delegate.indexDay].switchControl.backgroundColor = UIColor.white
            }
        }
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
