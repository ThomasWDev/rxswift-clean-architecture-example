//
//  SerachViewModel.swift
//  setScheduleTest
//
//  Created by Thomas Woodfin on 30/10/21.
//

import Foundation
import RxSwift
import RxCocoa

/* This is Search viewmodel class implementation of AbstractSearchViewModel. Which will be used to get search related data by search usecase*/
class SearchViewModel: AbstractSearchViewModel {
    
    // This struct will be used get input from viewcontroller
    public struct SearchInputModel {
        let query: String
        let year: Int
    }
    
    // This struct will be used get event with data from viewcontroller
    public struct SearchInput {
        let searchItemListTrigger: Observable<SearchInputModel>
    }
    
    // This struct will be used send event with observable data/response to viewcontroller 
    public struct SearchOutput {
        let searchItems: BehaviorRelay<[SearchApiRequest.ItemType]>
        let errorTracker: BehaviorRelay<NetworkError?>
    }
    
    public var usecase: AbstractUsecase
    
    public init(usecase: AbstractSearchUsecase) {
        self.usecase = usecase
    }
    
    public func getSearchOutput(input: SearchInput) -> SearchOutput {
        let searchListResponse = BehaviorRelay<[SearchApiRequest.ItemType]>(value: [])
        let errorResponse = BehaviorRelay<NetworkError?>(value: nil) 
        
        input.searchItemListTrigger.flatMapLatest({ [weak self] (inputModel) -> Observable<SearchApiRequest.ResponseType> in
            guard let weakSelf = self else {
                return Observable.just(SearchApiRequest.ResponseType())
            }
            
            //show shimmer
            searchListResponse.accept(Array<SearchApiRequest.ItemType>(repeating: SearchApiRequest.ItemType(), count: 9))
            
            //fetch movie list
            return weakSelf.searchData(query: inputModel.query, year: inputModel.year)
        }).subscribe(onNext: {
            response in
            
            searchListResponse.accept(response.results ?? [])
        }, onError: { [weak self] error in
            errorResponse.accept(error as? NetworkError)
        }, onCompleted: nil, onDisposed: nil)
        
        return SearchOutput.init(searchItems: searchListResponse, errorTracker: errorResponse)
    }
    
    public func searchData(query: String, year: Int) -> Observable<SearchApiRequest.ResponseType> {
        return (usecase as! AbstractSearchUsecase).search(query: query, year: year)
    }
}
