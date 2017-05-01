//
//  NewsResponseMapperTest.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import XCTest
@testable import TOZ_iOS

class NewsResponseMapperTest: XCTestCase {
    var newsItems: [NewsItem]?

    override func setUp() {
        super.setUp()
        var responseData: NSData?
        var json: Any?

        let path = Bundle.main.path(forResource: "GetNews", ofType: "json")
        if let path = path {
            responseData = try? NSData(contentsOfFile: path, options: [])
        }
        if let responseData = responseData {
            json = try? JSONSerialization.jsonObject(with: responseData as Data, options: [])
        }

        self.newsItems = try? NewsResponseMapper.process(json as AnyObject)

    }

    func testNewsCount() {
        XCTAssertEqual(self.newsItems?.count, 4)
    }

    func testNewsResponseMapper() {
        let firstNews = self.newsItems?[0]
        XCTAssertEqual(firstNews?.title, "Do oddziału TOZ trafił nowy pies!")
        XCTAssertEqual(firstNews?.contents, "Dzisiaj do naszej placówki w Szczecinie trafił nowy pies. Nazywa się Reksio i jest dwuletnim jamnikiem. Został znaleziony w pobliżu ogrodów działkowych.")
        XCTAssertEqual(firstNews?.photoUrl, BackendConfiguration.shared.baseURL.appendingPathComponent("storage/a9/2c/a92ccd6a-f51c-4ff0-8645-02adff409051.jpg"))
        XCTAssertEqual(firstNews?.published, Date(timeIntervalSince1970: TimeInterval(1222333444555)))
    }

}
