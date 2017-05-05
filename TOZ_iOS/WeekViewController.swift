//
//  WeekViewController.swift
//  TOZ_iOS
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

protocol WeekViewControllerDelegate: class {
    func didUpdateReservations(_ controller: WeekViewController, didUpdate reservations: [ScheduleItem.ReservationItem])
}

class WeekViewController: UIViewController {

    @IBOutlet var weekdayLabelCollection: [WeekDayControl]!
    @IBOutlet var scheduleMorningLabelCollection: [ScheduleControl]!
    @IBOutlet var scheduleAfternoonLabelCollection: [ScheduleControl]!
    var weekdayArray: [String]!
    var reservations: [ScheduleItem.ReservationItem] = []
    weak var delegate: WeekViewControllerDelegate?

    @IBAction func didTapScheduleMorningButton(_ sender: ScheduleControl) {
        let index = scheduleMorningLabelCollection.index(of: sender)
        if scheduleMorningLabelCollection[index!].scheduleSelected == false {
            //user with privilege to add operation (todo)
            scheduleMorningLabelCollection[index!].scheduleSelected = true
            delegate?.didUpdateReservations(self, didUpdate: reservations)
        } else {
            //admin with privilege to delete operation (todo)
        }
    }
    @IBAction func didTapScheduleAfternoonButton(_ sender: ScheduleControl) {
        let index = scheduleAfternoonLabelCollection.index(of: sender)
        if scheduleAfternoonLabelCollection[index!].scheduleSelected == false {
            //user with privilege to add operation (todo)
            scheduleAfternoonLabelCollection[index!].scheduleSelected = true
            delegate?.didUpdateReservations(self, didUpdate: reservations)
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
            let indexAtDay = item.index(weekdayArray[i].endIndex, offsetBy: -2)
            weekdayLabelCollection[i].valueOfDayLabel.text = item[indexAtDay..<item.endIndex]
            weekdayLabelCollection[i].weekdaySelected = false

            var firstCharForenameString, firstCharSurnameString: String
            if let index = reservations.index(where: { item == formatter.string(from: $0.date) }) {
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

        if let index = weekdayArray.index(where: { $0 == formatter.string(from: Date()) }) {
            weekdayLabelCollection[index].weekdaySelected = true
        }
    }

  }
