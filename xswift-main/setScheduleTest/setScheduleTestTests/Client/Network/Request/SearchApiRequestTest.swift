//
//  SearchApiRequestTest.swift
//  setScheduleTestTests
//
//  Created by Thomas Woodfin on 4/11/21.
//

import XCTest
@testable import setScheduleTest

class SearchApiRequestTest: XCTestCase {
    var request: SearchApiRequest!
    let query = "the"
    let year = 2000

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        request = SearchApiRequest.searchMovie(params: MoviewSearchParams(query: query, year: year))
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        request = nil
    }

    func testUrls() {
        XCTAssertEqual(request.baseURL.absoluteString, "\(AppConfig.shared.getServerConfig().getBaseUrl())/\(AppConfig.shared.getServerConfig().getApiVersion())/")
        XCTAssertEqual(request.baseURL.path, "/\(AppConfig.shared.getServerConfig().getApiVersion())")
        XCTAssertEqual(request.path, "search/movie")
    }
    
    func testParameters() {
        XCTAssertEqual(request.parameters["query"] as! String, query)
        XCTAssertEqual(request.parameters["year"] as! Int, year)
        XCTAssertEqual(request.headers as! [String: String], [String: String]())
    }
    
    func testResponseType() {
        XCTAssertTrue(SearchApiRequest.ItemType.self is Movie.Type)
        XCTAssertTrue(SearchApiRequest.ResponseType.self is SearchResponse<Movie>.Type)
    }
    
    func testMethod() {
        XCTAssertEqual(request.method, RequestType.GET)
        XCTAssertNotEqual(request.method, RequestType.POST)
    }
}
