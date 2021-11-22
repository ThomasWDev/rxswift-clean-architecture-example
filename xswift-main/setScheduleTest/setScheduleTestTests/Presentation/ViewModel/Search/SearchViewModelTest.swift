//
//  SearchViewModelTest.swift
//  setScheduleTestTests
//
//  Created by Thomas Woodfin on 3/11/21.
//

import XCTest
@testable import setScheduleTest
import RxSwift

class SearchViewModelTest: XCTestCase {
    private var disposeBag: DisposeBag!
    private var searchViewModel: AbstractSearchViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        disposeBag = DisposeBag()
        searchViewModel = SearchViewModel(usecase: MockSearchUsecase(repository: MockSearchRepository()))
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        disposeBag = nil
        searchViewModel = nil
    }

    func testUsecase() {
        XCTAssertNotNil(searchViewModel.usecase)
        XCTAssertNotNil(searchViewModel.usecase.repository)
        XCTAssertNotNil(searchViewModel.usecase.repository.apiClient)
        XCTAssertNotNil(searchViewModel.usecase.repository.apiClient.session)
    }
    
    func testSearchMovies() {
        var result: [SearchApiRequest.ItemType]!
        var networkError: NetworkError?
        let query = "the"
        let year = 2000
        
        let expectationSuccess = self.expectation(description: "Wait for searchViewModel to load succress respone")
        
        let searchInput = SearchViewModel.SearchInput(searchItemListTrigger: Observable.just(SearchViewModel.SearchInputModel(query: query, year: year)))
        let searchOutput = searchViewModel.getSearchOutput(input: searchInput)
        
        //populate table view
        searchOutput.searchItems
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { response in
                result = response
                expectationSuccess.fulfill()
            }, onError: { error in
                networkError = error as! NetworkError
                expectationSuccess.fulfill()
            }).disposed(by: disposeBag)
        
        let expectationError = self.expectation(description: "Wait for searchViewModel to load error")
        
        // detect error
        searchOutput.errorTracker
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { error in
                networkError = error 
                expectationError.fulfill()
            }).disposed(by: disposeBag)
        
        waitForExpectations(timeout: 5, handler: nil)
        
        //stubbed response to check data which are received through non-mock components
        let stubbedResposne = StubResponseProvider.getResponse(type: SearchApiRequest.ResponseType.self).results ?? [Movie]()
        
        //asserts
        XCTAssertEqual(result.count, stubbedResposne.count)
        XCTAssertNotNil(result)
        XCTAssertEqual(result[0].id, stubbedResposne[0].id)
        XCTAssertEqual(result[1].title, stubbedResposne[1].title)
        XCTAssertNotEqual(result[2].voteCount, stubbedResposne[3].voteCount)
        XCTAssertNotEqual(result[3].voteCount, stubbedResposne[2].voteCount)
        XCTAssertNil(networkError)
    }
    
    func testSearchData() {
        var result: [SearchApiRequest.ItemType]!
        var networkError: NetworkError?
        let query = "the"
        let year = 2000
        
        let expectation = self.expectation(description: "Wait for searchViewModel searchData to load.")
        
        searchViewModel.searchData(query: query, year: year)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { response in
                result = response.results
                expectation.fulfill()
            }, onError: { error in
                networkError = error as! NetworkError
                expectation.fulfill()
            }).disposed(by: disposeBag)
        
        waitForExpectations(timeout: 5, handler: nil)
        
        //stubbed response to check data which are received through non-mock components
        let stubbedResposne = StubResponseProvider.getResponse(type: SearchApiRequest.ResponseType.self).results ?? [Movie]()
        
        //asserts
        XCTAssertEqual(result.count, stubbedResposne.count)
        XCTAssertNotNil(result)
        XCTAssertEqual(result[0].id, stubbedResposne[0].id)
        XCTAssertEqual(result[1].title, stubbedResposne[1].title)
        XCTAssertNotEqual(result[2].voteCount, stubbedResposne[3].voteCount)
        XCTAssertNotEqual(result[3].voteCount, stubbedResposne[2].voteCount)
        XCTAssertNil(networkError)
    }
}
