//
//  WeekViewController.swift
//  TOZ_iOS
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

protocol WeekViewControllerDelegate: class {
    func weekViewController(_ controller: WeekViewController, didUpdate reservations: [ScheduleItem.ReservationItem])
}

class WeekViewController: UIViewController {

    @IBOutlet var weekdayLabelCollection: [WeekDayControl]!
    @IBOutlet var scheduleMorningLabelCollection: [ScheduleControl]!
    @IBOutlet var scheduleAfternoonLabelCollection: [ScheduleControl]!
    var weekdayArray: [WeekdayItem]!
    var reservations: [ScheduleItem.ReservationItem] = []
    weak var delegate: WeekViewControllerDelegate?

    @IBAction func didTapScheduleMorningButton(_ sender: ScheduleControl) {
        let index = scheduleMorningLabelCollection.index(of: sender)
        if scheduleMorningLabelCollection[index!].scheduleSelected == false {
            //user with privilege to add operation (todo)
            scheduleMorningLabelCollection[index!].scheduleSelected = true
            delegate?.weekViewController(self, didUpdate: reservations)
        } else {
            //admin with privilege to delete operation (todo)
        }
    }
    @IBAction func didTapScheduleAfternoonButton(_ sender: ScheduleControl) {
        let index = scheduleAfternoonLabelCollection.index(of: sender)
        if scheduleAfternoonLabelCollection[index!].scheduleSelected == false {
            //user with privilege to add operation (todo)
            scheduleAfternoonLabelCollection[index!].scheduleSelected = true
            delegate?.weekViewController(self, didUpdate: reservations)
        } else {
            //admin with privilege to delete operation (todo)
        }
    }
    override func viewDidLoad() {
        for (weekdayLabel, text) in zip(weekdayLabelCollection, ["P", "W", "Ś", "C", "P", "S", "N"]) {
            weekdayLabel.dayOfWeekLabel.text = text
        }

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        for (i, item) in weekdayArray.enumerated() {
            //set day numbers and select current data
            weekdayLabelCollection[i].valueOfDayLabel.text = weekdayArray[i].day
            weekdayLabelCollection[i].weekdaySelected = false

            var firstCharForenameString, firstCharSurnameString: String
            // add help function helper to compare current date to WeekdayItem
            let dateTemp: String = "\(item.year)-\(item.month)-\(item.day)"
            if let index = reservations.index(where: { dateTemp == formatter.string(from: $0.date) }) {
                if let firstCharForename = reservations[index].ownerForename?.characters.first {
                    firstCharForenameString = String(firstCharForename)
                } else {
                    firstCharForenameString = ""
                }
                if let firstCharSurname = reservations[index].ownerSurname?.characters.first {
                    firstCharSurnameString = String(firstCharSurname)
                } else {
                    firstCharSurnameString = ""
                }
                if reservations[index].timeOfDay == .morning {
                    scheduleMorningLabelCollection[i].scheduleLabel.text = firstCharForenameString.appending(firstCharSurnameString)
                    scheduleMorningLabelCollection[i].scheduleSelected = true
                } else {
                    scheduleAfternoonLabelCollection[i].scheduleLabel.text = firstCharForenameString.appending(firstCharSurnameString)
                    scheduleAfternoonLabelCollection[i].scheduleSelected = true
                }
            } else {
                scheduleMorningLabelCollection[i].scheduleSelected = false
                scheduleAfternoonLabelCollection[i].scheduleSelected = false
            }
        }

        // add help function helper to compare current date to WeekdayItem
        let dateTemp: WeekdayItem = WeekdayItem(day: "05", month: "05", year: "2017", dataLabel: "May 2017")
        if let index = weekdayArray.index(where: { $0.day == dateTemp.day && $0.month == dateTemp.month && $0.year == dateTemp.year }) {
            weekdayLabelCollection[index].weekdaySelected = true
        }
    }

  }
