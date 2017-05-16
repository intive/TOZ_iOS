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
    var firstAnimal: AnimalItem?

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
        firstAnimal = (animalItems?[0])
    }

    func testAnimalsCount() {
        XCTAssertEqual(animalItems?.count, 4)
    }

    func testFirstAnimalID() {
        XCTAssertEqual(firstAnimal?.animalID, "c5296892-347f-4b2e-b1c6-6faff971f767")
    }

    func testFirstAnimalName() {
        XCTAssertEqual(firstAnimal?.name, "PIORUN")
    }

    func testFirstAnimalType() {
        XCTAssertEqual(firstAnimal?.type, "PIES")
    }

    func testFirstAnimalSex() {
        XCTAssertEqual(firstAnimal?.sex, "MALE")
    }

    func testFirstAnimalDescription() {
        XCTAssertEqual(firstAnimal?.description, "Jamnik niskopodłogowy")
    }

    func testFirstAnimalAddress() {
        XCTAssertEqual(firstAnimal?.address, "Most cłowy")
    }

    func testFirstAnimalPublished() {
        XCTAssertEqual(firstAnimal?.created, Date(timeIntervalSince1970: TimeInterval(1490134074968/1000)))
    }

    func testFirstAnimalLastModified() {
        XCTAssertEqual(firstAnimal?.lastModified, Date(timeIntervalSince1970: TimeInterval(1490134074968/1000)))

    }

    func testFirstAnimalImage() {
                XCTAssertEqual(firstAnimal?.imageUrl, BackendConfiguration.shared.baseURL.appendingPathComponent("/zMX0Gcf.jpg"))
    }
}
