//
//  MockSearchUsecase.swift
//  setScheduleTestTests
//
//  Created by Thomas Woodfin on 3/11/21.
//

import Foundation
@testable import setScheduleTest
import RxSwift

class MockSearchUsecase: AbstractSearchUsecase {
    var repository: AbstractRepository
    
    public init(repository: AbstractSearchRepository) {
        self.repository = repository
    }
    
    public func search(query: String, year: Int) -> Observable<SearchApiRequest.ResponseType> {
        return (repository as! AbstractSearchRepository).get(query: query, year: year)
    }
}
