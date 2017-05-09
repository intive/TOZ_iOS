//
//  ScheduleResponseMapperTests.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import XCTest
@testable import TOZ_iOS

class ScheduleResponseMapperTests: XCTestCase {

    var reservationItemArray: [ReservationItem]?
    var firstReservationItem: ReservationItem?

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
        reservationItemArray = try? ScheduleResponseMapper.process(json as AnyObject)
        firstReservationItem = (reservationItemArray?[0])!
    }

    func testReservationItemID() {
        XCTAssertEqual(self.firstReservationItem?.idObject, "c5296892-347f-4b2e-b1c6-6faff971f767")
    }

    func testReservationItemTimeOfDay() {        XCTAssertEqual(self.firstReservationItem?.timeOfDay, TimeOfDay.morning)
    }

    func testReservationItemDate() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        XCTAssertEqual(formatter.string(from: (self.firstReservationItem!.date)), "2017-01-20")
    }

    func testReservationItemOwnerForename() {
        XCTAssertEqual(self.firstReservationItem?.ownerForename, "John")
    }

    func testReservationItemOwnerSurname() {
        XCTAssertEqual(self.firstReservationItem?.ownerSurname, "Doe")
    }
}
