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
        XCTAssertEqual(animalItems?.count, 14)
    }

    func testFirstAnimalID() {
        XCTAssertEqual(firstAnimal?.animalID, "c5296892-347f-4b2e-b1c6-6faff971f767")
    }

    func testFirstAnimalName() {
        XCTAssertEqual(firstAnimal?.name, "Burek")
    }

    func testFirstAnimalType() {
        XCTAssertEqual(firstAnimal?.type, "DOG")
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
        XCTAssertEqual(firstAnimal?.created, Date(timeIntervalSince1970: TimeInterval(1494852536847/1000)))
    }

    func testFirstAnimalLastModified() {
        XCTAssertEqual(firstAnimal?.lastModified, Date(timeIntervalSince1970: TimeInterval(1494854229092/1000)))

    }

    func testFirstAnimalImage() {
                XCTAssertEqual(firstAnimal?.imageUrl, BackendConfiguration.shared.photosURL.appendingPathComponent("n6aU0jt.jpg"))
    }
}
