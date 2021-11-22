//
//  MockMovieUsecase.swift
//  setScheduleTestTests
//
//  Created by Thomas Woodfin on 4/11/21.
//

import Foundation
@testable import setScheduleTest
import RxSwift

class MockMovieUsecase: AbstractMovieUsecase {
    var repository: AbstractRepository
    
    public init(repository: AbstractMovieRepository) {
        self.repository = repository
    }
    
    public func getMovieDetails(movieId: Int) -> Observable<MovieApiRequest.ResponseType> {
        return (repository as! AbstractMovieRepository).get(movieId: movieId)
    }
}
