//
//  CalendarService.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

class CalendarService {
    var weekCalendarOperation: CalendarWeekOperation! = nil
    var calendarData = [CalendarItem]()

    func requestWeeklyData(with fromDate: String, to endDate: String) -> [CalendarItem]? {
        weekCalendarOperation = CalendarWeekOperation(fromDate: fromDate, toDate: endDate)
        weekCalendarOperation.resultCompletion = { result in

            switch result {
            case .success(let weeksList):
                    self.calendarData = weeksList
            case .failure(let error):
                print ("\(error)")
            }
        }
        weekCalendarOperation.start()

        return self.calendarData
    }
}
