//
//  AbstractMovieUsecase.swift
//  setScheduleTest
//
//  Created by Thomas Woodfin 2/15/21.
//

import Foundation
import RxSwift

/* This is Movie usecase abstraction extented from AbstractUsecase. Which will be used to get movie related data from movie repository*/
protocol AbstractMovieUsecase: AbstractUsecase {
    func getMovieDetails(movieId: Int) -> Observable<MovieApiRequest.ResponseType>
}
