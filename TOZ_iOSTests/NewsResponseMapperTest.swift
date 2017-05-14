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
    var firstNews: NewsItem?

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
        firstNews = (newsItems?[0])

    }

    func testNewsCount() {
        XCTAssertEqual(self.newsItems?.count, 4)
    }

    func testFirstNewsTitle() {
        XCTAssertEqual(firstNews?.title, "WITAMY NOWEGO MIESZKAŃCA TOZ!")
    }

    func testFirstNewsContents() {
        XCTAssertEqual(firstNews?.contents, "Piorun został odnaleziony przy piekarni na ulicy Krzemiennej, gdy samotnie błąkał")
    }

    func testFirstNewsPhotoUrl() {
        XCTAssertEqual(firstNews?.photoUrl, BackendConfiguration.shared.baseURL.appendingPathComponent("/dIvN5kA.jpg"))
    }

    func testFirstNewsPublished() {
        XCTAssertEqual(firstNews?.published, Date(timeIntervalSince1970: TimeInterval(1222333444555)))
    }
}
