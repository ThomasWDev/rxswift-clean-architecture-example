//
//  AbstractSearchUsecase.swift
//  setScheduleTest
//
//  Created by Thomas Woodfin on 30/10/21.
//

import Foundation
import RxSwift

/* This is Search usecase abstraction extented from AbstractUsecase. Which will be used to get search related data from search repository*/
protocol AbstractSearchUsecase: AbstractUsecase {
    func search(query: String, year: Int) -> Observable<SearchApiRequest.ResponseType>
}
