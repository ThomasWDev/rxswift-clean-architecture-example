//
//  AbstractApiClient.swift
//  tawktestios
//
//  Created by Thomas Woodfin on 3/8/21.
//

import Foundation
import RxSwift

typealias NetworkCompletionHandler<T: Codable> = (Result<T, NetworkError>) -> Void

protocol AbstractApiClient: AnyObject {
    var session: AbstractURLSession {get set}
    var queueManager: QueueManager {get set}
    func enqueue<T: Codable>(apiRequest: APIRequest, type: T.Type, completionHandler: @escaping (NetworkCompletionHandler<T>))
    func send<T: Codable>(apiRequest: APIRequest, type: T.Type) -> Observable<T>
}
