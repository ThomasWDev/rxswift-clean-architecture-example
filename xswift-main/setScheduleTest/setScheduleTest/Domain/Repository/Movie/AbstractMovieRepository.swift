//
//  AbstractMovieRepository.swift
//  setScheduleTest
//
//  Created by Thomas Woodfin 2/15/21.
//

import Foundation
import RxSwift

/* This is Movie repository abstraction extented from AbstractRepository. Which will be used to get mvoie related from api client/server response*/
protocol AbstractMovieRepository: AbstractRepository {
     func get(movieId: Int) -> Observable<MovieApiRequest.ResponseType>
}
