//
//  WeekViewController.swift
//  TOZ_iOS
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class WeekViewController: UIViewController {

    @IBOutlet var weekdayLabelCollection: [WeekDayControl]!
    @IBOutlet var scheduleMorningLabelCollection: [ScheduleControl]!
    @IBOutlet var scheduleAfternoonLabelCollection: [ScheduleControl]!

    @IBAction func didTapScheduleMorningButton(_ sender: ScheduleControl) {
    }
    @IBAction func didTapScheduleAfternoonButton(_ sender: ScheduleControl) {
    }
  }
