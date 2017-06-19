//
//  AddScheduleResponseMapperTests.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import XCTest
@testable import TOZ_iOS

class AddScheduleResponseMapperTests: XCTestCase {

    var reservationItem: ReservationItem?

    override func setUp() {
        var responseData: NSData?
        var json: Any?

        let path = Bundle.main.path(forResource: "AddSchedule", ofType: "json")
        if let path = path {
            responseData = try? NSData(contentsOfFile: path, options: [])
        }
        if let responseData = responseData {
            json = try? JSONSerialization.jsonObject(with: responseData as Data, options: [])
        }
        reservationItem = try? GetScheduleResponseMapper.process(json as AnyObject)
    }

    func testReservationItemID() {
        XCTAssertEqual(self.reservationItem?.idObject, "111111-347f-4b2e-b1c6-6faff971f767")
    }

    func testReservationItemTimeOfDay() {
        XCTAssertEqual(self.reservationItem?.timeOfDay, TimeOfDay.morning)
    }

    func testReservationItemDate() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        XCTAssertEqual(formatter.string(from: (self.reservationItem!.date)), "2017-06-25")
    }

    func testReservationItemOwnerForename() {
        XCTAssertEqual(self.reservationItem?.ownerForename, "John")
    }

    func testReservationItemOwnerSurname() {
        XCTAssertEqual(self.reservationItem?.ownerSurname, "Doe")
    }

}
