//
//  MockApiClient.swift
//  setScheduleTestTests
//
//  Created by Thomas Woodfin on 2/11/21.
//

import XCTest
@testable import setScheduleTest
import RxSwift

class ApiClientTest: XCTestCase {
    private var apiClient: AbstractApiClient!
    private var disposeBag: DisposeBag!

    override func setUp() {
        apiClient = APIClient(session: MockURLSession(configuration: URLSessionConfigHolder.config))
        disposeBag = DisposeBag() 
    }
    
    override func tearDown() {
        apiClient = nil
        disposeBag = nil
    }
    
    func testApiClientWithSearchMovies() {
        let query = "the"
        let year = 2000
        
        let request = SearchApiRequest.searchMovie(params: MoviewSearchParams(query: query, year: year))
        let expectation = self.expectation(description: "Wait for \(request.path) to load.")
        var result: SearchApiRequest.ResponseType!
        var networkError: NetworkError?
        
        apiClient.send(apiRequest: request, type: SearchApiRequest.ResponseType.self)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] response in
                result = response
                expectation.fulfill()
            }, onError: { [weak self] error in
                networkError = error as! NetworkError
                expectation.fulfill()
            }).disposed(by: disposeBag)
        
        waitForExpectations(timeout: 5, handler: nil)
        
        //stubbed response to check data which are received through non-mock components
        let stubbedResposne = StubResponseProvider.getResponse(type: SearchApiRequest.ResponseType.self)
        
        //asserts
        XCTAssertEqual(result.results?.count ?? 0, stubbedResposne.results?.count ?? 0)
        XCTAssertNotNil(result)
        XCTAssertNotNil(result.results)
        XCTAssertEqual(result.results?[0].id ?? 0, stubbedResposne.results?[0].id ?? 0)
        XCTAssertEqual(result.results?[1].title ?? "", stubbedResposne.results?[1].title ?? "")
        XCTAssertNotEqual(result.results?[2].voteCount ?? 0, stubbedResposne.results?[3].voteCount ?? 0)
        XCTAssertNotEqual(result.results?[3].voteCount ?? 0, stubbedResposne.results?[2].voteCount ?? 0)
        XCTAssertNil(networkError)
    }
    
    func testApiClientWithMovieDetails() {
        let movieId = 630004
        let request = MovieApiRequest.getMovie(params: MovieDetailsParams(movieId: movieId))
        let expectation = self.expectation(description: "Wait for \(request.path) to load.")
        var result: MovieApiRequest.ResponseType!
        var networkError: NetworkError?
        
        apiClient.send(apiRequest: request, type: MovieApiRequest.ResponseType.self)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] response in
                result = response
                expectation.fulfill()
            }, onError: { [weak self] error in
                networkError = error as! NetworkError
                expectation.fulfill()
            }).disposed(by: disposeBag)
        
        waitForExpectations(timeout: 5, handler: nil)
        
        //stubbed response to check data which are received through non-mock components
        let stubbedResposne = StubResponseProvider.getResponse(type: MovieApiRequest.ResponseType.self)
        
        //asserts
        XCTAssertEqual(result.id, stubbedResposne.id)
        XCTAssertNotNil(result)
        XCTAssertEqual(result.title, stubbedResposne.title)
        XCTAssertEqual(result.originalTitle, stubbedResposne.originalTitle)
        XCTAssertEqual(result.overview, stubbedResposne.overview)
        XCTAssertEqual(result.popularity, stubbedResposne.popularity)
        XCTAssertEqual(result.voteCount, stubbedResposne.voteCount)
        XCTAssertEqual(result.voteAverage, stubbedResposne.voteAverage)
        XCTAssertNil(networkError)
    }
    
    func testApiClientPerformance() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            let request = SearchApiRequest.searchMovie(params: MoviewSearchParams(query: "the", year: 2000))
            let expectation = self.expectation(description: "Wait for \(request.path) to load to measure performance")
            var result: SearchApiRequest.ResponseType!
            var networkError: NetworkError?
            
            apiClient.send(apiRequest: request, type: SearchApiRequest.ResponseType.self)
                .observe(on: MainScheduler.instance)
                .subscribe(onNext: { [weak self] response in
                    result = response
                    expectation.fulfill()
                }, onError: { [weak self] error in
                    networkError = error as! NetworkError
                    expectation.fulfill()
                }).disposed(by: disposeBag)
            
            waitForExpectations(timeout: 5, handler: nil)
            
            //stubbed response to check data which are received through non-mock components
            let stubbedResposne = StubResponseProvider.getResponse(type: SearchApiRequest.ResponseType.self)
            
            //asserts
            XCTAssertEqual(result.results?.count ?? 0, stubbedResposne.results?.count ?? 0)
            XCTAssertNotNil(result)
            XCTAssertNotNil(result.results)
            XCTAssertEqual(result.results?[0].id ?? 0, stubbedResposne.results?[0].id ?? 0)
            XCTAssertEqual(result.results?[1].title ?? "", stubbedResposne.results?[1].title ?? "")
            XCTAssertNotEqual(result.results?[2].voteCount ?? 0, stubbedResposne.results?[3].voteCount ?? 0)
            XCTAssertNotEqual(result.results?[3].voteCount ?? 0, stubbedResposne.results?[2].voteCount ?? 0)
            XCTAssertNil(networkError)
        }
    }
}

