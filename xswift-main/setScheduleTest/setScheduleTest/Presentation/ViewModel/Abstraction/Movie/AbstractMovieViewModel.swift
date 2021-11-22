//
//  AbstractMovieViewModel.swift
//  setScheduleTest
//
//  Created by Thomas Woodfin on 2/11/21.
//

import Foundation
import RxSwift

/* This is Movie viewmodel abstraction extented from AbstractViewModel. Which will be used to get movie related data by movie usecase*/
protocol AbstractMovieViewModel: AbstractViewModel {
    // Transform the movie details input to output observable
    func getMovieOutput(input: MovieViewModel.MovieInput) -> MovieViewModel.MovieOutput
    
    // get movie details through api call
    func getMovieDetails(movieId: Int) -> Observable<MovieApiRequest.ResponseType>
}

