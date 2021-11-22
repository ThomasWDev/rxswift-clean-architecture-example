//
//  MovieApiRequestTest.swift
//  setScheduleTestTests
//
//  Created by Thomas Woodfin on 4/11/21.
//

import XCTest
@testable import setScheduleTest

class MovieApiRequestTest: XCTestCase {
    var request: MovieApiRequest!
    let movieId = 100

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        request = MovieApiRequest.getMovie(params: MovieDetailsParams(movieId: movieId))
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        request = nil
    }

    func testUrls() {
        XCTAssertEqual(request.baseURL.absoluteString, "\(AppConfig.shared.getServerConfig().getBaseUrl())/\(AppConfig.shared.getServerConfig().getApiVersion())/")
        XCTAssertEqual(request.baseURL.path, "/\(AppConfig.shared.getServerConfig().getApiVersion())")
        XCTAssertEqual(request.path, "movie/\(movieId)")
    }
    
    func testParameters() {
        XCTAssertEqual(request.parameters["movie_id"] as! Int, movieId)
        XCTAssertEqual(request.headers as! [String: String], [String: String]())
    }
    
    func testResponseType() {
        XCTAssertTrue(MovieApiRequest.ItemType.self is Movie.Type)
        XCTAssertTrue(MovieApiRequest.ResponseType.self is Movie.Type)
    }
    
    func testMethod() {
        XCTAssertEqual(request.method, RequestType.GET)
        XCTAssertNotEqual(request.method, RequestType.POST)
    }

}
