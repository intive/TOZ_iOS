//
//  AnimalResponseMapperTest.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import XCTest
@testable import TOZ_iOS

class ListOfAnimalsArrayMapperTest: XCTestCase {

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

    func testAnimalsCount() {
        XCTAssertEqual(animalItems?.count, 1)
    }

    func testListOfAnimalsArrayMapper() {
        let firstAnimal = self.animalItems?.first
        XCTAssertEqual(firstAnimal?.animalID, "c5296892-347f-4b2e-b1c6-6faff971f767")
        XCTAssertEqual(firstAnimal?.name, "Burek")
        XCTAssertEqual(firstAnimal?.type, "DOG")
        XCTAssertEqual(firstAnimal?.sex, "MALE")
        XCTAssertEqual(firstAnimal?.description, "Jamnik niskopodłogowy")
        XCTAssertEqual(firstAnimal?.address, "Most cłowy")
        XCTAssertEqual(firstAnimal?.created, Date(timeIntervalSince1970: TimeInterval(1490134074968/1000)))
        XCTAssertEqual(firstAnimal?.lastModified, Date(timeIntervalSince1970: TimeInterval(1490134074968/1000)))
        XCTAssertEqual(firstAnimal?.imageUrl, BackendConfiguration.shared.baseURL.appendingPathComponent("storage/a5/0d/4d/a50d4d4c-ccd2-4747-8dec-d6d7f521336e.jpg"))
    }

}
