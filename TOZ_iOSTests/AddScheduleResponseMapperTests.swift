//
//  AddScheduleResponseMapperTests.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import XCTest
@testable import TOZ_iOS

class AddScheduleResponseMapperTests: XCTestCase {

    var reservationItem: ReservationItem?
    var addScheduleOperation: AddScheduleOperation?

    override func setUp() {

        let newItem = ReservationItem.init(idObject: "", date: Date(), timeOfDay: .morning, ownerSurname: "Doe", ownerForename: "John")
        addScheduleOperation = AddScheduleOperation(dataObject: newItem, modificationMessage: "string")
        addScheduleOperation?.service.service = NetworkServiceMock()
        addScheduleOperation?.resultCompletion = { result in
                switch result {
                case .success(let successResponse):
                    self.reservationItem = successResponse
                case .failure(let error):
                    XCTFail("\(error)")
                }
            }
    }

    func testAddScheduleOperation() {
        addScheduleOperation?.start()
    }

}
