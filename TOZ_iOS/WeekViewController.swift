//
//  WeekViewController.swift
//  TOZ_iOS
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class WeekViewController: UIViewController {

    var delegate: CalendarViewController!
    var dataObj: CalendarDataUI!

    @IBAction func weekAction(_ sender: WeekDayView) {
        let tag = sender.tag
        if tag != delegate.indexDay {
            weekDayViews[delegate.indexDay].valueOfDay.backgroundColor = UIColor.white
        weekDayViews[delegate.indexDay].valueOfDay.setTitleColor(UIColor.darkGray, for: .normal)
            weekDayViews[delegate.indexDay].valueOfDay.layer.borderColor = UIColor.white.cgColor
            weekDayViews[tag].valueOfDay.backgroundColor = UIColor.white
            weekDayViews[tag].valueOfDay.setTitleColor(UIColor.darkGray, for: .normal)
            weekDayViews[tag].valueOfDay.layer.borderColor = UIColor.lightGray.cgColor
            delegate.indexDay = tag
        }
    }

    @IBAction func scheduleMorningAction(_ sender: ScheduleView) {
        let tag = sender.tag
        if tag == delegate.indexDay {
            if scheduleMoringViews[delegate.indexDay].switchControl.title(for: .normal) == nil {
                let alertController = UIAlertController(title: "Potwierdzasz \(delegate.calendarData[tag].date)?", message:
                    "Zarezerwowałeś termin", preferredStyle: UIAlertControllerStyle.alert)
                let yesAction = UIAlertAction(title: "Tak", style: .default) { (action: UIAlertAction!) in
                    //make reservation
                    print("make reservation \(action.title!)")
                    self.scheduleMoringViews[self.delegate.indexDay].switchControl.setTitle("BL", for: .normal)
                    self.scheduleMoringViews[self.delegate.indexDay].switchControl.setTitleColor(UIColor.darkText, for: .normal)
                    self.scheduleMoringViews[self.delegate.indexDay].switchControl.backgroundColor = UIColor.lightGray
                    self.scheduleMoringViews[self.delegate.indexDay].switchControl.layer.borderColor = UIColor.lightGray.cgColor

                    let alertView = UIAlertController(title: "Super", message: "Pomagasz ratować świat", preferredStyle: .alert)
                    alertView.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alertView, animated: true, completion: nil)
                }
                alertController.addAction(yesAction)
                let noAction = UIAlertAction(title: "Nie", style: .cancel) { (action: UIAlertAction!) in
                    print("Cancel action \(action.title!)")
                }
                alertController.addAction(noAction)
                self.present(alertController, animated: true, completion: nil)
            } else {
                let alertController = UIAlertController(title: "Usunięcie  \(dataObj.ownerId)", message:
                    "Czy potwierdzasz usunięcie?", preferredStyle: UIAlertControllerStyle.alert)
                let yesAction = UIAlertAction(title: "Tak", style: .default) { (action: UIAlertAction!) in
                    //delete reservation
                    print("delete reservation \(action.title!)")
                    self.scheduleMoringViews[self.delegate.indexDay].switchControl.setTitle(nil, for: .normal)
                    self.scheduleMoringViews[self.delegate.indexDay].switchControl.setTitleColor(UIColor.white, for: .normal)
                    self.scheduleMoringViews[self.delegate.indexDay].switchControl.backgroundColor = UIColor.white
                    self.scheduleMoringViews[self.delegate.indexDay].switchControl.layer.borderColor = UIColor.lightGray.cgColor

                }
                alertController.addAction(yesAction)
                let noAction = UIAlertAction(title: "Nie", style: .cancel) { (action: UIAlertAction!) in
                    print("Cancel action \(action.title!)")
                }
                alertController.addAction(noAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }

    @IBAction func scheduleAfterAction(_ sender: ScheduleView) {
        let tag = sender.tag
        if tag == delegate.indexDay {
            if scheduleAfterViews[delegate.indexDay].switchControl.title(for: .normal) == nil {
                let alertController = UIAlertController(title: "Potwierdzasz \(delegate.calendarData[tag].date)?", message:
                    "Zarezerwowałeś termin", preferredStyle: UIAlertControllerStyle.alert)
                let yesAction = UIAlertAction(title: "Tak", style: .default) { (action: UIAlertAction!) in
                    //make reservation
                    print("make reservation \(action.title!)")
                    self.scheduleAfterViews[self.delegate.indexDay].switchControl.setTitle("BL", for: .normal)
                    self.scheduleAfterViews[self.delegate.indexDay].switchControl.setTitleColor(UIColor.darkText, for: .normal)
                    self.scheduleAfterViews[self.delegate.indexDay].switchControl.backgroundColor = UIColor.lightGray
                    self.scheduleAfterViews[self.delegate.indexDay].switchControl.layer.borderColor = UIColor.lightGray.cgColor

                    let alertView = UIAlertController(title: "Super", message: "Pomagasz ratować świat", preferredStyle: .alert)
                    alertView.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alertView, animated: true, completion: nil)
                }
                alertController.addAction(yesAction)
                let noAction = UIAlertAction(title: "Nie", style: .cancel) { (action: UIAlertAction!) in
                    print("Cancel action \(action.title!)")
                }
                alertController.addAction(noAction)
                self.present(alertController, animated: true, completion: nil)
            } else {
                let alertController = UIAlertController(title: "Usunięcie  \(dataObj.ownerId)", message:
                    "Czy potwierdzasz usunięcie?", preferredStyle: UIAlertControllerStyle.alert)
                let yesAction = UIAlertAction(title: "Tak", style: .default) { (action: UIAlertAction!) in
                    //delete reservation
                    print("delete reservation \(action.title!)")
                    self.scheduleAfterViews[self.delegate.indexDay].switchControl.setTitle(nil, for: .normal)
                    self.scheduleAfterViews[self.delegate.indexDay].switchControl.setTitleColor(UIColor.white, for: .normal)
                    self.scheduleAfterViews[self.delegate.indexDay].switchControl.backgroundColor = UIColor.white
                    self.scheduleAfterViews[self.delegate.indexDay].switchControl.layer.borderColor = UIColor.lightGray.cgColor

                }
                alertController.addAction(yesAction)
                let noAction = UIAlertAction(title: "Nie", style: .cancel) { (action: UIAlertAction!) in
                    print("Cancel action \(action.title!)")
                }
                alertController.addAction(noAction)
                self.present(alertController, animated: true, completion: nil)
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

    func updateUX() {

        for dayAfterDay in weekDayViews! {
            dayAfterDay.dayOfweek.text = dataObj.dayOfWeek
            dayAfterDay.valueOfDay.setTitle(dataObj.date, for: .normal)
            if delegate.indexDay == dayAfterDay.tag {
                dayAfterDay.valueOfDay.backgroundColor = UIColor.white
                dayAfterDay.valueOfDay.setTitleColor(UIColor.lightGray, for: .normal)
                dayAfterDay.valueOfDay.layer.borderColor = UIColor.lightGray.cgColor
                dayAfterDay.dayOfweek.textColor = UIColor.lightGray
            } else {
                dayAfterDay.valueOfDay.backgroundColor = UIColor.white
                dayAfterDay.valueOfDay.setTitleColor(UIColor.lightGray, for: .normal)
                dayAfterDay.valueOfDay.layer.borderColor = UIColor.white.cgColor
                dayAfterDay.dayOfweek.textColor = UIColor.lightGray
            }
        }

        for scheduleItem in scheduleMoringViews! {
            if dataObj.morning {
                scheduleItem.switchControl.backgroundColor = UIColor.lightGray
                scheduleItem.switchControl.setTitleColor(UIColor.darkGray, for: .normal)
                scheduleItem.switchControl.setTitle(dataObj.ownerId, for: .normal)
                scheduleItem.switchControl.layer.borderColor = UIColor.lightGray.cgColor
            } else {
                scheduleItem.switchControl.backgroundColor = UIColor.white
                scheduleItem.switchControl.setTitleColor(UIColor.white, for: .normal)
                scheduleItem.switchControl.setTitle(nil, for: .normal)
                scheduleItem.switchControl.layer.borderColor = UIColor.lightGray.cgColor
            }
        }

        for scheduleItem in scheduleAfterViews! {
            if dataObj.afterNoon {
                scheduleItem.switchControl.backgroundColor = UIColor.lightGray
                scheduleItem.switchControl.setTitleColor(UIColor.darkGray, for: .normal)
                scheduleItem.switchControl.setTitle(dataObj.ownerId, for: .normal)
                scheduleItem.switchControl.layer.borderColor = UIColor.lightGray.cgColor
            } else {
                scheduleItem.switchControl.backgroundColor = UIColor.white
                scheduleItem.switchControl.setTitleColor(UIColor.white, for: .normal)
                scheduleItem.switchControl.setTitle(nil, for: .normal)
                scheduleItem.switchControl.layer.borderColor = UIColor.lightGray.cgColor
            }
        }

    }
}
