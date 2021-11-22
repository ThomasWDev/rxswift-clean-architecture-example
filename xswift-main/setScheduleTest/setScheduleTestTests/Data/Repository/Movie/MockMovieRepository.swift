//
//  MockMovieRepository.swift
//  setScheduleTestTests
//
//  Created by Thomas Woodfin on 4/11/21.
//

@testable import setScheduleTest
import RxSwift

class MockMovieRepository: AbstractMovieRepository {
    var apiClient: AbstractApiClient
    
    init(apiClient: AbstractApiClient = MockApiClient.shared) {
        self.apiClient = apiClient
    }
    
    public func get(movieId: Int) -> Observable<MovieApiRequest.ResponseType> {
        return apiClient.send(apiRequest: MovieApiRequest.getMovie(params: MovieDetailsParams(movieId: movieId)), type: MovieApiRequest.ResponseType.self)
    }
}
