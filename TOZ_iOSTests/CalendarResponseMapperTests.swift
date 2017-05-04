//
//  CalendarResponseMapperTests.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import XCTest
@testable import TOZ_iOS

class CalendarResponseMapperTests: XCTestCase {

    var scheduleItem: [ScheduleItem.ReservationItem]?

    override func setUp() {
        var responseData: NSData?
        var json: Any?

        let path = Bundle.main.path(forResource: "GetSchedule", ofType: "json")
        if let path = path {
            responseData = try? NSData(contentsOfFile: path, options: [])
        }
        if let responseData = responseData {
            json = try? JSONSerialization.jsonObject(with: responseData as Data, options: [])
        }
        scheduleItem = try? ScheduleResponseMapper.process(json as AnyObject)
    }

    func testCalendarResponseMapper() {
        XCTAssertEqual(self.scheduleItem?[0].idObject, "c5296892-347f-4b2e-b1c6-6faff971f767")
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        XCTAssertEqual(formatter.string(from: (self.scheduleItem?[0].date)!), "2017-01-20")
        XCTAssertEqual(self.scheduleItem?[0].timeOfDay, TimeOfDay.afternoon)
        XCTAssertEqual(self.scheduleItem?[0].ownerForename, "John")
        XCTAssertEqual(self.scheduleItem?[0].ownerSurname, "Doe")
    }
}
