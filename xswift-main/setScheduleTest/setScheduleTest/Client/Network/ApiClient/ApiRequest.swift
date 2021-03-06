//
//  ApiRequest.swift
//  tawktestios
//
//  Created by Thomas Woodfin on 7/23/21.
//

import Foundation


public enum RequestType: String {
    case GET, POST, DELETE, PUT, PATCH
}

public protocol APIRequest {
    var baseURL: URL {get}
    var method: RequestType { get }
    var path: String { get }
    var parameters: [String: Any] { get }
    var headers: [String: String] {get}
}

extension APIRequest {
    public func request(with baseURL: URL) -> URLRequest {
        guard var components = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: false) else {
            fatalError("Unable to create URL components")
        }
        
        components.queryItems = parameters.map {
            URLQueryItem(name: String($0), value: String(describing: $1))
        }
        
        guard let url = components.url else {
            fatalError("Could not get url")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.allHTTPHeaderFields = (headers as? [String: String]) ?? [String: String]()
        return request
    }
}



