//
//  SearchRepositoryTest.swift
//  setScheduleTestTests
//
//  Created by Thomas Woodfin on 3/11/21.
//

import XCTest
@testable import setScheduleTest
import RxSwift

class SearchRepositoryTest: XCTestCase {
    private var disposeBag: DisposeBag!
    private var searchRepository: AbstractSearchRepository!
    private var apiClient: MockApiClient!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        disposeBag = DisposeBag()
        apiClient = MockApiClient.shared
        searchRepository = SearchRepository(apiClient: apiClient)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        apiClient = nil
        searchRepository = nil
        disposeBag = nil
    }

    func testApiClient() {
        XCTAssertNotNil(searchRepository.apiClient)
        XCTAssertNotNil(searchRepository.apiClient.session)
    }
    
    func testGetMovies() {
        let expectation = self.expectation(description: "Wait for search repository to load.")
        var result: SearchApiRequest.ResponseType!
        var networkError: NetworkError?
        let query = "the"
        let year = 2000
        
        searchRepository.get(query: query, year: year)
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
