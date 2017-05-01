//
//  AnimalResponseMapperTest.swift
//  TOZ_iOS
//
//  Created by Rafal Gorczynski on 01.05.2017.
//  Copyright © 2017 intive. All rights reserved.
//

import XCTest
@testable import TOZ_iOS

class AnimalResponseMapperTest: XCTestCase {

    var animalItems: [AnimalItem]?

    override func setUp() {
        var responseData: NSData?
        var json: Any?

        let path = Bundle.main.path(forResource: "GetAnimals", ofType: "json")
        if let path = path {
            responseData = try? NSData(contentsOfFile: path, options: [])
        }
        if let responseData = responseData {
            json = try? JSONSerialization.jsonObject(with: responseData as Data, options: [])
        }
        self.animalItems = try? ListOfAnimalsArrayMapper.process(json as AnyObject)
    }

    func testAnimalResponseMapper() {
        XCTAssertEqual(self.animalItems?[0].animalID, "c5296892-347f-4b2e-b1c6-6faff971f767")
        XCTAssertEqual(self.animalItems?[0].name, "Burek")
        XCTAssertEqual(self.animalItems?[0].type, "DOG")
        XCTAssertEqual(self.animalItems?[0].sex, "MALE")
        XCTAssertEqual(self.animalItems?[0].description, "Jamnik niskopodłogowy")
        XCTAssertEqual(self.animalItems?[0].address, "Most cłowy")
        XCTAssertEqual(self.animalItems?[0].created, Date(timeIntervalSince1970: TimeInterval(1490134074968)))
        XCTAssertEqual(self.animalItems?[0].lastModified, 1490134074968)
        XCTAssertEqual(self.animalItems?[0].imageUrl, BackendConfiguration.shared.baseURL.appendingPathComponent("storage/a5/0d/4d/a50d4d4c-ccd2-4747-8dec-d6d7f521336e.jpg"))
    }

}
