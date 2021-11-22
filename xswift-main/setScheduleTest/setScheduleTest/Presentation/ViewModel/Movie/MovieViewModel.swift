//
//  MovieViewModel.swift
//  setScheduleTest
//
//  Created by Thomas Woodfin 2/15/21.
//

import Foundation
import RxSwift
import RxCocoa

/* This is Movie viewmodel implementation  of AbstractMovieViewModel. Which will be used to get movie related data by movie usecase*/
class MovieViewModel: AbstractMovieViewModel {
    
    // This struct will be used get event with data from viewcontroller
    public struct MovieInput {
        let movieDetailsTrigger: Observable<Int>
    }
    
    // This struct will be used send event with observable data/response to viewcontroller
    public struct MovieOutput {
        let movieDetails: BehaviorRelay<MovieApiRequest.ResponseType?>
        let errorTracker: BehaviorRelay<NetworkError?>
    }
    
    public var usecase: AbstractUsecase
    
    public init(usecase: AbstractMovieUsecase) {
        self.usecase = usecase
    }
    
    public func getMovieOutput(input: MovieInput) -> MovieOutput {
        let movieResponse = BehaviorRelay<MovieApiRequest.ResponseType?>(value: nil)
        let errorResponse = BehaviorRelay<NetworkError?>(value: nil)
        
        input.movieDetailsTrigger.flatMapLatest({ [weak self] (movieId) -> Observable<MovieApiRequest.ResponseType> in
            guard let weakSelf = self else {
                return Observable.just(MovieApiRequest.ResponseType())
            }
            debugPrint("MovieViewModel -- getMovieOutput() -- movieDetailsTrigger -- movieId = \(movieId)")
            //fetch movie details
            return weakSelf.getMovieDetails(movieId: movieId)
        }).subscribe(onNext: {
            response in
            
            movieResponse.accept(response)
        }, onError: { [weak self] error in
            errorResponse.accept(error as? NetworkError)
        }, onCompleted: nil, onDisposed: nil)
        
        return MovieOutput.init(movieDetails: movieResponse, errorTracker: errorResponse)
    }
    
    public func getMovieDetails(movieId: Int) -> Observable<MovieApiRequest.ResponseType> {
        return (usecase as! AbstractMovieUsecase).getMovieDetails(movieId: movieId)
    }
}
