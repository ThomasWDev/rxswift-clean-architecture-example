//
//  SearchUsecase.swift
//  setScheduleTest
//
//  Created by Thomas Woodfin on 30/10/21.
//

import Foundation
import RxSwift

/* This is Search usecase class implentation from AbstractSearchUsecase. Which will be used to get search related data from search repository*/
class SearchUsecase: AbstractSearchUsecase {
    var repository: AbstractRepository
    
    public init(repository: AbstractSearchRepository) {
        self.repository = repository
    }
    
    public func search(query: String, year: Int) -> Observable<SearchApiRequest.ResponseType> {
        return (repository as! AbstractSearchRepository).get(query: query, year: year)
    }
}
