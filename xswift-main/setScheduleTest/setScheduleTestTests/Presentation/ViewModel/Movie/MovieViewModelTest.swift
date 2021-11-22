//
//  MovieViewModelTest.swift
//  setScheduleTestTests
//
//  Created by Thomas Woodfin on 4/11/21.
//

import XCTest
@testable import setScheduleTest
import RxSwift

class MovieViewModelTest: XCTestCase {
    private var disposeBag: DisposeBag!
    private var movieViewModel: AbstractMovieViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        disposeBag = DisposeBag()
        movieViewModel = MovieViewModel(usecase: MockMovieUsecase(repository: MockMovieRepository()))
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        disposeBag = nil
        movieViewModel = nil
    }

    func testUsecase() {
        XCTAssertNotNil(movieViewModel.usecase)
        XCTAssertNotNil(movieViewModel.usecase.repository)
        XCTAssertNotNil(movieViewModel.usecase.repository.apiClient)
        XCTAssertNotNil(movieViewModel.usecase.repository.apiClient.session)
    }

    func testMovieDetailsOutput() {
        var result: MovieApiRequest.ResponseType!
        var networkError: NetworkError?
        let movieId = 630004
        
        let expectationSuccess = self.expectation(description: "Wait for movieViewModel to get succress respone")
        
        let movieInput = MovieViewModel.MovieInput(movieDetailsTrigger: Observable.just(movieId))
        let movieOutput = movieViewModel.getMovieOutput(input: movieInput)
        
        //receive response data
        movieOutput.movieDetails
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { response in
                result = response
                expectationSuccess.fulfill()
            }, onError: { error in
                networkError = error as! NetworkError
                expectationSuccess.fulfill()
            }).disposed(by: disposeBag)
        
        let expectationError = self.expectation(description: "Wait for movieViewModel to get error")
        
        // detect error
        movieOutput.errorTracker
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { error in
                expectationError.fulfill()
            }).disposed(by: disposeBag)
        
        //wait for the expectations
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
    
    func testGetMovieDetails() {
        var result: MovieApiRequest.ResponseType!
        var networkError: NetworkError?
        let movieId = 630004
        
        let expectation = self.expectation(description: "Wait for searchViewModel searchData to load.")
        
        movieViewModel.getMovieDetails(movieId: movieId)
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
