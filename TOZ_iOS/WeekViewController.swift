//
//  WeekViewController.swift
//  TOZ_iOS
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

protocol WeekViewControllerDelegate: class {
    func didUpdateContents(_ sender: WeekViewController)
}

class WeekViewController: UIViewController {

    @IBOutlet var weekdayLabelCollection: [WeekDayControl]!
    @IBOutlet var scheduleMorningLabelCollection: [ScheduleControl]!
    @IBOutlet var scheduleAfternoonLabelCollection: [ScheduleControl]!
    var weekdayArray: [String]!
    var contentsWeekController: [ScheduleItem.ReservationItem] = []
    weak var delegate: WeekViewControllerDelegate?

    @IBAction func didTapScheduleMorningButton(_ sender: ScheduleControl) {
        let index = scheduleMorningLabelCollection.index(of: sender)
        if scheduleMorningLabelCollection[index!].scheduleSelected == false {
            //user with privilege to add operation (todo)
            scheduleMorningLabelCollection[index!].scheduleSelected = true
            delegate?.didUpdateContents(self)
        } else {
            //admin with privilege to delete operation (todo)
        }
    }
    @IBAction func didTapScheduleAfternoonButton(_ sender: ScheduleControl) {
        let index = scheduleAfternoonLabelCollection.index(of: sender)
        if scheduleAfternoonLabelCollection[index!].scheduleSelected == false {
            //user with privilege to add operation (todo)
            scheduleAfternoonLabelCollection[index!].scheduleSelected = true
            delegate?.didUpdateContents(self)
        } else {
            //admin with privilege to delete operation (todo)
        }
    }
    override func viewDidLoad() {
        weekdayLabelCollection[0].dayOfWeekLabel.text = "P"
        weekdayLabelCollection[1].dayOfWeekLabel.text = "W"
        weekdayLabelCollection[2].dayOfWeekLabel.text = "Ś"
        weekdayLabelCollection[3].dayOfWeekLabel.text = "C"
        weekdayLabelCollection[4].dayOfWeekLabel.text = "P"
        weekdayLabelCollection[5].dayOfWeekLabel.text = "S"
        weekdayLabelCollection[6].dayOfWeekLabel.text = "N"

    }

    override func viewWillAppear(_ animated: Bool) {

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        for (i, item) in weekdayArray.enumerated() {
            //set day numbers and select current data
            let indexAtDay = item.index(weekdayArray[i].endIndex, offsetBy: -2)
            weekdayLabelCollection[i].valueOfDayLabel.text = item[indexAtDay..<item.endIndex]
            weekdayLabelCollection[i].weekdaySelected = false

            if let index = contentsWeekController.index(where: { item == formatter.string(from: $0.date) }) {
                let firstCharForename = contentsWeekController[index].ownerForename?[(contentsWeekController[index].ownerForename?.startIndex)!]
                let firstCharSurname = contentsWeekController[index].ownerSurname?[(contentsWeekController[index].ownerSurname?.startIndex)!]
                if contentsWeekController[index].timeOfDay == .morning {
                    scheduleMorningLabelCollection[i].scheduleLabel.text = String(describing: firstCharForename!) + String(describing: firstCharSurname!)
                    scheduleMorningLabelCollection[i].scheduleSelected = true
                } else {
                    scheduleAfternoonLabelCollection[i].scheduleLabel.text = String(describing: firstCharForename!) + String(describing: firstCharSurname!)
                    scheduleAfternoonLabelCollection[i].scheduleSelected = true
                }
            } else {
                scheduleMorningLabelCollection[i].scheduleSelected = false
                scheduleAfternoonLabelCollection[i].scheduleSelected = false
            }
        }

        if let index = weekdayArray.index(where: { $0 == formatter.string(from: Date()) }) {
            weekdayLabelCollection[index].weekdaySelected = true
        }
    }

  }
