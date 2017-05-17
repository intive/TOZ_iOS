//
//  WeekViewController.swift
//  TOZ_iOS
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

protocol WeekViewControllerDelegate: class {
    func weekViewController(_ controller: WeekViewController, didUpdate reservations: [ReservationItem])
}

class WeekViewController: UIViewController {

    @IBOutlet var weekdayLabelCollection: [WeekDayControl]!
    @IBOutlet var scheduleMorningLabelCollection: [ScheduleControl]!
    @IBOutlet var scheduleAfternoonLabelCollection: [ScheduleControl]!
    var weekdayArray: [WeekdayItem]!
    var reservations: [ReservationItem] = []
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

        for (i, item) in weekdayArray.enumerated() {
            weekdayLabelCollection[i].valueOfDayLabel.text = weekdayArray[i].day
            if item == WeekdayItem(from: Date()) {
                weekdayLabelCollection[i].weekdaySelected = true
            } else {
                weekdayLabelCollection[i].weekdaySelected = false
            }

            var firstCharForenameString, firstCharSurnameString: String
            let reserversionInTheSameDay = reservations.filter({ item == WeekdayItem(from: $0.date) })
            for res in reserversionInTheSameDay {
                if let firstCharForename = res.ownerForename?.characters.first {
                    firstCharForenameString = String(firstCharForename)
                } else {
                    firstCharForenameString = ""
                }
                if let firstCharSurname = res.ownerSurname?.characters.first {
                    firstCharSurnameString = String(firstCharSurname)
                } else {
                    firstCharSurnameString = ""
                }
                if res.timeOfDay == .morning {
                    scheduleMorningLabelCollection[i].scheduleLabel.text = firstCharForenameString.appending(firstCharSurnameString)
                    scheduleMorningLabelCollection[i].scheduleSelected = true
                } else {
                    scheduleAfternoonLabelCollection[i].scheduleLabel.text = firstCharForenameString.appending(firstCharSurnameString)
                    scheduleAfternoonLabelCollection[i].scheduleSelected = true
                }
            }
            if nil == reservations.index(where: { item == WeekdayItem(from: $0.date) }) {
                scheduleMorningLabelCollection[i].scheduleSelected = false
                scheduleAfternoonLabelCollection[i].scheduleSelected = false
            }
        }

    }

  }
