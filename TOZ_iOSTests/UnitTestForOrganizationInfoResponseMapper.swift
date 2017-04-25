//
//  TestIfUsingMockBackend.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import XCTest
@testable import TOZ_iOS

class UnitTestForOrganizationInfoResponseMapper: XCTestCase {

    var operation = OrganizationInfoOperation()
    var expectedResponse: String = "Nagłówek"
    var responseData: NSData?
    var json: Any?
    var responseItem: OrganizationInfoItem?

    override func setUp() {
        let path = Bundle.main.path(forResource: "GetOrganizationInfo", ofType: "json")
        if let path = path {
            responseData = try? NSData(contentsOfFile: path, options: [])
        }
        if let responseData = responseData {
            json = try? JSONSerialization.jsonObject(with: responseData as Data, options: [])
        }
        responseItem = try? OrganizationInfoResponseMapper.process(json as AnyObject)
    }

    func UnitTestForOrganizationInfoResponseMapper() {
        XCTAssert(self.responseItem?.header == self.expectedResponse)
    }
}
