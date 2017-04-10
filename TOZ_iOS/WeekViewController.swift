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
                let alertController = UIAlertController(title: "Potwierdzasz \(delegate.calendarData[tag].date)?", message:
                    "Zarezerowałeś termin", preferredStyle: UIAlertControllerStyle.alert)
                let yesAction = UIAlertAction(title: "Tak", style: .default) { (action: UIAlertAction!) in
                    //make reservation
                    self.scheduleMoringViews[self.delegate.indexDay].switchControl.setTitle("RK", for: .normal)
                    self.scheduleMoringViews[self.delegate.indexDay].switchControl.setTitleColor(UIColor.white, for: .normal)
                    self.scheduleMoringViews[self.delegate.indexDay].switchControl.backgroundColor = UIColor.lightGray
            
                    let alertView = UIAlertController(title: "Super", message: "Pomagasz ratować świat", preferredStyle: .alert)
                    alertView.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alertView, animated: true, completion: nil)
                }
                alertController.addAction(yesAction)
                let noAction = UIAlertAction(title: "Nie", style: .cancel) { (action:UIAlertAction!) in
                    //back
                }
                alertController.addAction(noAction)
                self.present(alertController, animated: true, completion: nil)
            } else {
                let alertController = UIAlertController(title: "Usunięcie  \(dataObj.ownerId)", message:
                    "Czy potwierdzasz usunięcie?", preferredStyle: UIAlertControllerStyle.alert)
                let yesAction = UIAlertAction(title: "Tak", style: .default) { (action: UIAlertAction!) in
                    //detlete reservation
                    self.scheduleMoringViews[self.delegate.indexDay].switchControl.setTitle(nil, for: .normal)
                    self.scheduleMoringViews[self.delegate.indexDay].switchControl.setTitleColor(UIColor.lightGray, for: .normal)
                    self.scheduleMoringViews[self.delegate.indexDay].switchControl.backgroundColor = UIColor.white
                }
                alertController.addAction(yesAction)
                let noAction = UIAlertAction(title: "Nie", style: .cancel) { (action:UIAlertAction!) in
                    //back
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
                    "Zarezerowałeś termin", preferredStyle: UIAlertControllerStyle.alert)
                let yesAction = UIAlertAction(title: "Tak", style: .default) { (action: UIAlertAction!) in
                    //make reservation
                    self.scheduleAfterViews[self.delegate.indexDay].switchControl.setTitle("RK", for: .normal)
                    self.scheduleAfterViews[self.delegate.indexDay].switchControl.setTitleColor(UIColor.white, for: .normal)
                    self.scheduleAfterViews[self.delegate.indexDay].switchControl.backgroundColor = UIColor.lightGray
                    
                    let alertView = UIAlertController(title: "Super", message: "Pomagasz ratować świat", preferredStyle: .alert)
                    alertView.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alertView, animated: true, completion: nil)
                }
                alertController.addAction(yesAction)
                let noAction = UIAlertAction(title: "Nie", style: .cancel) { (action:UIAlertAction!) in
                    //back
                }
                alertController.addAction(noAction)
                self.present(alertController, animated: true, completion: nil)
            } else {
                let alertController = UIAlertController(title: "Usunięcie \(dataObj.ownerId)", message:
                    "Czy potwierdzasz usunięcie?", preferredStyle: UIAlertControllerStyle.alert)
                let yesAction = UIAlertAction(title: "Tak", style: .default) { (action: UIAlertAction!) in
                    //detlete reservation
                    self.scheduleAfterViews[self.delegate.indexDay].switchControl.setTitle(nil, for: .normal)
                    self.scheduleAfterViews[self.delegate.indexDay].switchControl.setTitleColor(UIColor.lightGray, for: .normal)
                    self.scheduleAfterViews[self.delegate.indexDay].switchControl.backgroundColor = UIColor.white
                }
                alertController.addAction(yesAction)
                let noAction = UIAlertAction(title: "Nie", style: .cancel) { (action:UIAlertAction!) in
                    //back
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
                dayAfterDay.valueOfDay.setTitleColor(UIColor.darkText, for: .normal)
                dayAfterDay.dayOfweek.textColor = UIColor.white
            } else {
                dayAfterDay.valueOfDay.backgroundColor = UIColor.lightGray
                dayAfterDay.valueOfDay.setTitleColor(UIColor.white, for: .normal)
                dayAfterDay.dayOfweek.textColor = UIColor.white
            }
        }

        for scheduleItem in scheduleMoringViews! {
            if dataObj.morning {
                scheduleItem.switchControl.backgroundColor = UIColor.lightGray
                scheduleItem.switchControl.setTitle(dataObj.ownerId, for: .normal)
            } else {
                scheduleItem.switchControl.backgroundColor = UIColor.white
                scheduleItem.switchControl.setTitle(nil, for: .normal)
            }
        }

        for scheduleItem in scheduleAfterViews! {
            if dataObj.afterNoon {
                scheduleItem.switchControl.backgroundColor = UIColor.lightGray
                scheduleItem.switchControl.setTitle(dataObj.ownerId, for: .normal)
            } else {
                scheduleItem.switchControl.backgroundColor = UIColor.white
                scheduleItem.switchControl.setTitle(nil, for: .normal)
            }
        }

    }
}
