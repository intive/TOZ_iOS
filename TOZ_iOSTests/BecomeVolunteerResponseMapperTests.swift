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
        XCTAssertEqual(self.becomeVolunteerItem?.howToHelpDescription, "Włącz się w realizowane przez nas działania, ale także inicjuj i realizuj własne pomysły. Dla nas liczy się przede wszystkim chęć pomocy i konsekwencja w działaniu. \n\nZostań społecznym inspektorem TOZ, członkiem, wolontariuszem, spacerowiczem psów, które są pod naszą opieką, a może stworzysz dom tymczasowy dla kota, psa albo innego potrzebującego zwierzaka?")
    }
}
