//
//  AbstractRepository.swift
//  setScheduleTest
//
//  Created by Thomas Woodfin on 30/10/21.
//

import Foundation

/* Base repository abstraction will be used to make all other repository of this project, It will have apiClient to get data from server */
protocol AbstractRepository: AnyObject {
    var apiClient: AbstractApiClient {get}
}
