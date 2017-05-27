//
//  CalendarViewController.swift
//  TOZ_iOS
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit
import Foundation

class CalendarViewController: UIViewController {

    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var currentDateLabel: UILabel!
    var pageController: UIPageViewController!
    var weekPages = [WeekViewController]()
    private var indexPage = 0
    var reservations: [ReservationItem] = []
    var calendarHelper = CalendarHelper()
    var weekScheduleOperation: GetScheduleWeekOperation!
    var currentWeekController: WeekViewController!
    var weekdayArray: [WeekdayItem]! {
        didSet {
            if weekdayArray.isEmpty {
                currentDateLabel.text = ""
            } else {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MM"
                let month = dateFormatter.monthSymbols[Int(weekdayArray[0].month)! - 1]
                currentDateLabel.text = month + " " + weekdayArray[0].year
            }
        }
    }

    @IBAction func nextWeek(_ sender: Any) {
        weekdayArray = calendarHelper.nextWeek()
        currentWeekController = nextWeekController()
        retrieveReservationsinWeek(when: .forward)
    }
    
    @IBAction func previousWeek(_ sender: Any) {
        weekdayArray = calendarHelper.previousWeek()
        currentWeekController = nextWeekController()
        retrieveReservationsinWeek(when: .reverse)
    }
    
    func nextWeekController() -> WeekViewController {
        indexPage -= 1
        indexPage = abs(indexPage)
        
        return weekPages[indexPage]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageController.dataSource = self
        // swiftlint:disable:next force_cast
        let weekAfter: WeekViewController = self.storyboard?.instantiateViewController(withIdentifier: "WeekViewController") as! WeekViewController
        // swiftlint:disable:next force_cast
        let weekBefore: WeekViewController = self.storyboard?.instantiateViewController(withIdentifier: "WeekViewController") as! WeekViewController
        
        weekPages.append(weekBefore)
        weekPages.append(weekAfter)
        weekBefore.delegate = self
        weekAfter.delegate = self
        
        weekdayArray = calendarHelper.weekdayItemArray()
        currentWeekController = weekBefore
        
        retrieveReservationsinWeek(when: .forward)
    }
    
    override func viewDidLayoutSubviews() {
        prevButton.setTitleColor(Color.Calendar.PreviousButton.text, for: .normal)
        prevButton.backgroundColor = Color.Calendar.PreviousButton.background
        nextButton.setTitleColor(Color.Calendar.NextButton.text, for: .normal)
        nextButton.backgroundColor = Color.Calendar.NextButton.background
        
        prevButton.layer.cornerRadius = prevButton.bounds.height * 0.5
        nextButton.layer.cornerRadius = nextButton.bounds.height * 0.5
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // swiftlint:disable:next force_cast
        pageController = segue.destination as! UIPageViewController
    }
    
    func retrieveReservationsinWeek(when direction: UIPageViewControllerNavigationDirection) {
        weekScheduleOperation = GetScheduleWeekOperation(fromDate: weekdayArray[0].dataLabel, toDate: weekdayArray[6].dataLabel)
        weekScheduleOperation.resultCompletion = { result in
            switch result {
            case .success(let listOfReservation):
                DispatchQueue.main.async {
                    self.currentWeekController.weekdayArray = self.weekdayArray
                    self.currentWeekController.reservations = listOfReservation
                    self.pageController.setViewControllers([self.currentWeekController], direction: direction, animated: true)
                }
            case .failure(let error):
                print ("\(error)")
            }
        }
        
        weekScheduleOperation.start()
    }
}

extension CalendarViewController: WeekViewControllerDelegate {
    func weekViewController(_ controller: WeekViewController, didUpdate reservations: [ReservationItem]) {
        self.reservations = controller.reservations
    }
}

extension CalendarViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        return nil
    }
    
}
