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
        XCTAssertEqual(self.organizationInfoItem?.name, "POZ Szczecin")
        XCTAssertEqual(self.organizationInfoItem?.invitationText, "Hello to POZ")
        XCTAssertEqual(self.organizationInfoItem?.volunteerText, "POZ volunteers are people who..")
        XCTAssertEqual(self.organizationInfoItem?.street, "ul. Przykładowa")
        XCTAssertEqual(self.organizationInfoItem?.houseNumber, "1")
        XCTAssertEqual(self.organizationInfoItem?.apartmentNumber, "/1")
        XCTAssertEqual(self.organizationInfoItem?.postCode, "02-123")
        XCTAssertEqual(self.organizationInfoItem?.city, "Szczecin")
        XCTAssertEqual(self.organizationInfoItem?.country, "Polska")
        XCTAssertEqual(self.organizationInfoItem?.email, "mail@example.com")
        XCTAssertEqual(self.organizationInfoItem?.phone, "+48123123123")
        XCTAssertEqual(self.organizationInfoItem?.fax, "+48123123123")
        XCTAssertEqual(self.organizationInfoItem?.website, "http://example.com/")
        XCTAssertEqual(self.organizationInfoItem?.accountNumber, "61109010140000071219812874")
        XCTAssertEqual(self.organizationInfoItem?.bankName, "SuperBank")
    }
}
