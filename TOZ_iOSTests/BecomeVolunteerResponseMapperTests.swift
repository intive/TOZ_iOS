//
//  BecomeVolunteerResponseMapperTests.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import XCTest
@testable import TOZ_iOS

class BecomeVolunteerResponseMapperTests: XCTestCase {

    var becomeVolunteerItem: BecomeVolunteerItem?

    override func setUp() {
        var responseData: NSData?
        var json: Any?

        let path = Bundle.main.path(forResource: "getBecomeVolunteer", ofType: "json")
        if let path = path {
            responseData = try? NSData(contentsOfFile: path, options: [])
        }
        if let responseData = responseData {
            json = try? JSONSerialization.jsonObject(with: responseData as Data, options: [])
        }
        becomeVolunteerItem = try? BecomeVolunteerResponseMapper.process(json as AnyObject)
    }

    func testBecomeVolunteerHeader() {
        XCTAssertEqual(self.becomeVolunteerItem?.howToHelpDescription, "Zostań wolontariuszem, spacerowiczem psów, a może stworzysz dom tymczasowy?")
    }
}
