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
        XCTAssertEqual(firstNews?.title, "WITAMY NOWEGO MIESZKAŃCA TOZ!")
        XCTAssertEqual(firstNews?.contents, "Piorun został odnaleziony przy piekarni na ulicy Krzemiennej, gdy samotnie błąkał (...) Czytaj dalej")
        XCTAssertEqual(firstNews?.photoUrl, BackendConfiguration.shared.baseURL.appendingPathComponent("https://images.pexels.com/photos/47466/pexels-photo-47466.jpeg?w=1200&h=627&fit=crop&auto=compress&cs=tinysrgb"))
        XCTAssertEqual(firstNews?.published, Date(timeIntervalSince1970: TimeInterval(1222333444555)))
    }

}
