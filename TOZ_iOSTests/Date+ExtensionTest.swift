//
//  Date+ExtensionTest.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import XCTest
@testable import TOZ_iOS

class Date_ExtensionTest: XCTestCase {
    let now = Date()
    var pastDate: Date?
    var fiveDaysAgoDate: Date?
    var twoHoursAgoDate: Date?
    var fiveMinutesAgoDate: Date?
    var tenSecondsAgoDate: Date?

    override func setUp() {
        super.setUp()
        pastDate = Date(timeIntervalSince1970: 1493596800)
        fiveDaysAgoDate = now - TimeInterval(432000)
        twoHoursAgoDate = now - TimeInterval(7201)
        fiveMinutesAgoDate = now - TimeInterval(301)
        tenSecondsAgoDate = now - TimeInterval (10)
    }

    func testDateToFormattedString() {
        XCTAssertEqual(pastDate?.dateToFormattedString(), "1/05/2017")
        XCTAssertEqual(fiveDaysAgoDate?.dateToFormattedString(), "5 dni temu")
        XCTAssertEqual(twoHoursAgoDate?.dateToFormattedString(), "2 godzin temu")
        XCTAssertEqual(fiveMinutesAgoDate?.dateToFormattedString(), "5 minut temu")
        XCTAssertEqual(tenSecondsAgoDate?.dateToFormattedString(), "Przed chwilą")
    }

}
