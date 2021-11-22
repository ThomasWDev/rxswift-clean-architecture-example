//
//  MockURLSession.swift
//  setScheduleTestTests
//
//  Created by Thomas Woodfin on 3/11/21.
//

import Foundation
@testable import setScheduleTest

class MockURLSession: AbstractURLSession {
    var responseType: Codable.Type?
    
    required init(configuration: URLSessionConfiguration = URLSessionConfigHolder.config) {
        defaultConfig = configuration
    }
    
    func dataTask<T: Codable>(with request: URLRequest, type: T.Type, completionHandler: @escaping URLSessionDataTaskResult) -> URLSessionDataTask {
        let data = StubResponseProvider.getData(type: type)
        let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: "1.0", headerFields: request.allHTTPHeaderFields)
        let error: Error? = nil
        
        completionHandler(data, response, error)
        
        return URLSession.shared.dataTask(with: request.url!)
    }
}

public func getStubbResponse<T: Codable>(type: T.Type, completionHandler: @escaping (NetworkCompletionHandler<T>)){
    let data = StubResponseProvider.getData(type: type)
    
    guard let data = data else {
        completionHandler(.failure(.noDataError(code: 401, message: "No data found in response")))
        return
    }
    
    guard let resultData = try? JSONDecoder().decode(T.self, from: data) else {
        completionHandler(.failure(.decodingError(code: 401, message: "No data found in response")))
        return
    }
    
    completionHandler(.success(resultData))
}
