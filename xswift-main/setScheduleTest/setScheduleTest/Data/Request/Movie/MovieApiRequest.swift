//
//  MoviewRequestApi.swift
//  setScheduleTest
//
//  Created by Thomas Woodfin 2/15/21.
//

import Foundation

enum MovieApiRequest {
    case getMovie(params: Parameterizable)
}

extension MovieApiRequest: APIRequest {
    public var baseURL: URL {
        let url =  "\(AppConfig.shared.getServerConfig().getBaseUrl())/\(AppConfig.shared.getServerConfig().getApiVersion())/"
        return URL(string: url)!
    }
    
    public typealias ItemType = Movie
    public typealias ResponseType = ItemType
    
    public var method: RequestType {
        switch self {
            case .getMovie: return .GET
        }
    }
    
    public var path: String {
        switch self {
            case .getMovie: return "movie/\(parameters["movie_id"] as! Int)"
        }
    }
    
    public var parameters: [String: Any]{
        var parameter: [String: Any] = [:]
        
        switch self {
            case .getMovie (let params):
                parameter = params.asRequestParam
        }
        
        return parameter
    }
    
    public var headers: [String: String] {
        return [String: String]()
    }
}


