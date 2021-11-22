//
//  MovieDetailsRepositoryTest.swift
//  setScheduleTestTests
//
//  Created by Thomas Woodfin on 4/11/21.
//

import XCTest
@testable import setScheduleTest
import RxSwift

class MovieRepositoryTest: XCTestCase {
    private var disposeBag: DisposeBag!
    private var movieRepository: AbstractMovieRepository!
    private var apiClient: MockApiClient!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        disposeBag = DisposeBag()
        apiClient = MockApiClient.shared
        movieRepository = MovieRepository(apiClient: apiClient)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        apiClient = nil
        movieRepository = nil
        disposeBag = nil
    }

    func testApiClient() {
        XCTAssertNotNil(movieRepository.apiClient)
        XCTAssertNotNil(movieRepository.apiClient.session)
    }
    
    func testGetMovieDetails() {
        let movieId = 630004
        var result: MovieApiRequest.ResponseType!
        var networkError: NetworkError?
        
        let expectation = self.expectation(description: "Wait for movieRepository to load moview details")
        
        movieRepository.get(movieId: movieId)
            .observe(on: MainScheduler.instance) 
            .subscribe(onNext: { response in
                result = response
                expectation.fulfill()
            }, onError: { error in
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
}
