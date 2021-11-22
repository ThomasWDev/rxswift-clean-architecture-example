//
//  MockSearchRepository.swift
//  setScheduleTestTests
//
//  Created by Thomas Woodfin on 3/11/21.
//

import Foundation
@testable import setScheduleTest
import RxSwift


class MockSearchRepository: AbstractSearchRepository {
    var apiClient: AbstractApiClient
    
    init(apiClient: AbstractApiClient = MockApiClient.shared) {
        self.apiClient = apiClient
    }
    
    public func get(query: String, year: Int) -> Observable<SearchApiRequest.ResponseType> {
        return apiClient.send(apiRequest: SearchApiRequest.searchMovie(params: MoviewSearchParams(query: query, year: year)), type: SearchApiRequest.ResponseType.self)
    }
}
