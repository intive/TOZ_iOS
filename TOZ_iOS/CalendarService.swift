//
//  CalendarService.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

class CalendarService {
    let weekCalendarOperation = CalendarWeekOperation()

    func requestWeeklyData(with fromDate: Date, to endDate: Date) -> [CalendarEntity]? {

        return nil
    }
}

final class CalendarWeekRequest: BackendAPIRequest {
    var endpoint: String {
            return "/schedule"
    }
    var method: NetworkService.Method {
        return .GET
    }
    var parameters: [String: Any]? {
        return nil
    }
    var headers: [String: String]? {
        return defaultJSONHeaders()
    }
}

class CalendarWeekOperation: ServiceOperation {
    private let request: CalendarWeekRequest = CalendarWeekRequest()

}
