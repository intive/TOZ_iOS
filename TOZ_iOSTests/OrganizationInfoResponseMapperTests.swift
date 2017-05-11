//
//  OrganizationInfoResponseMapperTests.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import XCTest
@testable import TOZ_iOS

class OrganizationInfoResponseMapperTests: XCTestCase {

    var organizationInfoItem: OrganizationInfoItem?

    override func setUp() {
        var responseData: NSData?
        var json: Any?

        let path = Bundle.main.path(forResource: "GetOrganizationInfo", ofType: "json")
        if let path = path {
            responseData = try? NSData(contentsOfFile: path, options: [])
        }
        if let responseData = responseData {
            json = try? JSONSerialization.jsonObject(with: responseData as Data, options: [])
        }
        organizationInfoItem = try? OrganizationInfoResponseMapper.process(json as AnyObject)
    }

    func testOrganizationInfoItemHeader() {
        XCTAssertEqual(self.organizationInfoItem?.header, "Nagłówek")
        XCTAssertEqual(self.organizationInfoItem?.description, "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
        XCTAssertEqual(self.organizationInfoItem?.name, "Fundacja Towarzystwo Pomocy Zwierzętom")
        XCTAssertEqual(self.organizationInfoItem?.branch, "Oddział FTOZ Szczecin")
        XCTAssertEqual(self.organizationInfoItem?.addressStreet, "ul. Przykładowa")
        XCTAssertEqual(self.organizationInfoItem?.addressHouseNumber, "12")
        XCTAssertEqual(self.organizationInfoItem?.addressPostcode, "71-111")
        XCTAssertEqual(self.organizationInfoItem?.addressCity, "Szczecin")
        XCTAssertEqual(self.organizationInfoItem?.bankAccountNumber, "63 1020 4999 0000 9876 5432 1010")
        XCTAssertEqual(self.organizationInfoItem?.bankAccountBankName, "string")
    }
}
