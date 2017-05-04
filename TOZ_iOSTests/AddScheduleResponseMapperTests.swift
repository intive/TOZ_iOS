//
//  AddScheduleResponseMapperTests.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import XCTest
@testable import TOZ_iOS

class AddScheduleResponseMapperTests: XCTestCase {

    var scheduleItem: ScheduleItem.ReservationItem?
    var addScheduleOperation: AddScheduleOperation?

    override func setUp() {

        let newItem = ScheduleItem.ReservationItem.init(idObject: "", date: Date(), timeOfDay: .morning, ownerSurname: "Doe", ownerForename: "John")
        addScheduleOperation = AddScheduleOperation(dataObject: newItem, modificationMessage: "string")
        addScheduleOperation?.service.service = NetworkServiceMock()
        addScheduleOperation?.resultCompletion = { result in
                switch result {
                case .success(let successResponse):
                    self.scheduleItem = successResponse
                    self.checkAddScheduleResponse()
                case .failure(let error):
                    print ("\(error)")
                }
            }
    }

    func testAddScheduleResponse() {
        addScheduleOperation?.start()
    }

    func checkAddScheduleResponse() {
        XCTAssertEqual(self.scheduleItem?.idObject, "111111-347f-4b2e-b1c6-6faff971f767")
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        XCTAssertEqual(formatter.string(from: (self.scheduleItem?.date)!), "2017-01-21")
        XCTAssertEqual(self.scheduleItem?.timeOfDay, TimeOfDay.afternoon)
        XCTAssertEqual(self.scheduleItem?.ownerForename, "John")
        XCTAssertEqual(self.scheduleItem?.ownerSurname, "Doe")
    }

}
