//
//  Date+ExtensionTests.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import XCTest
@testable import TOZ_iOS

class Date_ExtensionTests: XCTestCase {
    let now = Date()

    func testPastDateIsFormattedCorrectly() {
        let pastDate = Date(timeIntervalSince1970: 1493596800)
        XCTAssertEqual(pastDate.dateToFormattedString(), "1/05/2017")
    }

    func testDatesNotOlderThanSevenDays() {
        let fiveDaysAgoDate = now - TimeInterval(432000)
        XCTAssertEqual(fiveDaysAgoDate.dateToFormattedString(), "5 dni temu")
    }

    func testDatesNewerThanOneDay() {
        let twoHoursAgoDate = now - TimeInterval(7201)
        XCTAssertEqual(twoHoursAgoDate.dateToFormattedString(), "2 godzin temu")
    }

    func testDatesNewerThanOneHour() {
        let fiveMinutesAgoDate = now - TimeInterval(301)
        XCTAssertEqual(fiveMinutesAgoDate.dateToFormattedString(), "5 minut temu")
    }

    func testDatesNewerThanOneMinute() {
        let tenSecondsAgoDate = now - TimeInterval (10)
        XCTAssertEqual(tenSecondsAgoDate.dateToFormattedString(), "Przed chwilą")
    }

}
