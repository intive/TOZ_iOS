//
//  WeekViewController.swift
//  TOZ_iOS
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class WeekViewController: UIViewController {

    @IBOutlet weak var calendarStack: UIStackView!

    @IBOutlet weak var scheduleMorning: UIStackView!

    @IBOutlet weak var scheduleAfternoon: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let scheduleM = Bundle.main.loadNibNamed("Schedule", owner: self, options: nil)?.first as? ScheduleView {
            scheduleMorning.addSubview(scheduleM)
        }
        if let scheduleA = Bundle.main.loadNibNamed("Schedule", owner: self, options: nil)?.first as? ScheduleView {
            scheduleAfternoon.addSubview(scheduleA)
        }
        if let weekDay = Bundle.main.loadNibNamed("WeekDay", owner: self, options: nil)?.first as? WeekDayView {
            calendarStack.addSubview(weekDay)
        }

    }

}
