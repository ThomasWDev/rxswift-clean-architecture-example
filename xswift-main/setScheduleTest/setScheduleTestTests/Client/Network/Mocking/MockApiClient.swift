//
//  MockApiClient.swift
//  setScheduleTestTests
//
//  Created by Thomas Woodfin on 3/11/21.
//

import XCTest
@testable import setScheduleTest
import RxSwift

class MockApiClient: AbstractApiClient {
    public static let shared = MockApiClient()
    public var session: AbstractURLSession
    public var queueManager: QueueManager

    
    public init(session: AbstractURLSession = MockURLSession(configuration: URLSessionConfigHolder.config), withQueueManager queueManager: QueueManager = QueueManager()) {
        self.session = session
        self.queueManager = queueManager
    }
    
    public func enqueue<T: Codable>(apiRequest: APIRequest, type: T.Type, completionHandler: @escaping (NetworkCompletionHandler<T>)) {
        let operation = NetworkOperation(apiRequest: apiRequest, type: type, completionHandler: completionHandler)
        operation.qualityOfService = .utility
        queueManager.enqueue(operation)
    }
    
    public func send<T: Codable>(apiRequest: APIRequest, type: T.Type) -> Observable<T> {
        let request = apiRequest.request(with: apiRequest.baseURL)
//        let session = URLSession(configuration: config)
        
        return Observable.create { [weak self] observer -> Disposable in
            let task: URLSessionDataTask? = self?.session.dataTask(with: request, type: type) { [weak self] data, response, error in
                debugPrint("MockApiClient -- send() -- response = \((try? JSONSerialization.jsonObject(with: data ?? Data([]), options: .allowFragments)) ?? NSDictionary())")
                
                guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                    observer.onError(NetworkError.serverError(code: (response as? HTTPURLResponse)?.statusCode ?? 401, message: "Request failed"))
                    return
                }
                
                guard let mime = response.mimeType, mime == "application/json" else {
                    observer.onError(NetworkError.wrongMimeTypeError(code: response.statusCode, message: "Wrong mimetype"))
                    return
                }

                guard let responseData = data else{
                    observer.onError(NetworkError.noDataError(code: response.statusCode, message: "No data found in response"))
                    return
                }
                 
                let resultData = try? JSONDecoder().decode(type, from: responseData)
                
                 if let result = resultData{
                    observer.onNext(result)
                 }else{
                    observer.onError(NetworkError.decodingError(code: response.statusCode, message: "Decoding error, Wrong response type"))
                 }
                
                observer.onCompleted()
            }
            task?.resume()
            
            return Disposables.create()
        }
    }
}
