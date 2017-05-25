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
            let date = weekdayArray[index!]

            let newReservation = ReservationItem(idObject: "", date: CalendarHelper().date(from: date), timeOfDay: .morning, ownerSurname: nil, ownerForename: nil)
            let alertController = UIAlertController(title: "Potwierdzasz?", message: "Zarezerwowałeś termin \(date.dataLabel)", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Tak", style: UIAlertActionStyle.default) { (_ : UIAlertAction) -> Void in
                self.addReservation(add: newReservation, turnOn: self.scheduleMorningLabelCollection[index!])
                }
            let cancelAction = UIAlertAction(title: "Nie", style: UIAlertActionStyle.cancel, handler: nil)

            alertController.addAction(okAction)
            alertController.addAction(cancelAction)

            self.present(alertController, animated: true, completion: nil)
        } else {
            //admin with privilege to delete operation (todo)
        }
    }
    @IBAction func didTapScheduleAfternoonButton(_ sender: ScheduleControl) {
        let index = scheduleAfternoonLabelCollection.index(of: sender)
        if scheduleAfternoonLabelCollection[index!].scheduleSelected == false {
            //user with privilege to add operation (todo)
            let date = weekdayArray[index!]

            let newReservation = ReservationItem(idObject: "", date: CalendarHelper().date(from: date), timeOfDay: .afternoon, ownerSurname: nil, ownerForename: nil)
            let alertController = UIAlertController(title: "Potwierdzasz?", message: "Zarezerwowałeś termin \(date.dataLabel)", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Tak", style: UIAlertActionStyle.default) { (_ : UIAlertAction) -> Void in
                self.addReservation(add: newReservation, turnOn: self.scheduleAfternoonLabelCollection[index!])
            }
            let cancelAction = UIAlertAction(title: "Nie", style: UIAlertActionStyle.cancel, handler: nil)

            alertController.addAction(okAction)
            alertController.addAction(cancelAction)

            self.present(alertController, animated: true, completion: nil)
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

        updateUI()
    }

    func errorInfoPopUp() {
        let alertController = UIAlertController(title: "Nie zapisano poprawnie rezerwacji", message: "Sprawdz połączenie z serwerem", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)

        alertController.addAction(okAction)

        self.present(alertController, animated: true, completion: nil)
    }

    func addReservation(add newReservation: ReservationItem, turnOn label: ScheduleControl) {

        //if user role is not admin
        let addOperation = AddScheduleOperation(dataObject: newReservation, modificationMessage: "new reservation", ownerId: nil)
        addOperation.resultCompletion = { result in
            switch result {
            case .success(let newReservationRespond):
                DispatchQueue.main.async {
                    if newReservation.date == newReservationRespond.date && newReservation.timeOfDay == newReservationRespond.timeOfDay {
                        label.scheduleSelected = true
                        self.reservations.append(newReservation)
                        self.delegate?.weekViewController(self, didUpdate: self.reservations)
                        self.updateUI()
                    } else {
                        print("ERRROR - objects are not equel")
                        print("requested: \(newReservation)")
                        print("responded: \(newReservationRespond)")
                        self.errorInfoPopUp()
                    }
                }
            case .failure(let error):
                print ("\(error)")
            }
        }
        addOperation.start()
    }

    func updateUI() {
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
