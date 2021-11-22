//
//  StubResponseProvider.swift
//  tawktestios
//
//  Created by Thomas Woodfin on 3/8/21.
//

import Foundation


public class StubResponseProvider{
    public static func getType<T: Codable>(type: T.Type) -> T{
        var result: T!
        
        if T.self is SearchResponse<Movie>.Type {
            result = SearchResponse<Movie>() as! T
        }
        
        return result
    }
    
    public static func getResponse<T: Codable>(type: T.Type) -> T{
        var result: T!
        
        // model type is search response with movie
        if type is SearchResponse<Movie>.Type {
            let data  = StubResponseProvider.getData(type: type.self)
            
            if let data = data {
                result = try? JSONDecoder().decode(type, from: data)
            }else {
                result = SearchResponse<Movie>() as! T
            }
        }
        
        // model type is  movie details
        if type is Movie.Type {
            let data  = StubResponseProvider.getData(type: type.self)
            
            if let data = data {
                result = try? JSONDecoder().decode(type, from: data)
            }else {
                result = Movie() as! T
            }
        }
        
        return result
    }
    
    public static func getData<T: Codable>(type: T.Type) -> Data?{
        var response: [String : Any] = [String:Any]()
        var data: Data? = nil
        
        if T.self is SearchResponse<Movie>.Type {
            response = responseForSearchMovieList
        }
        
        //if type is movie details
        else  if T.self is Movie.Type {
            response = responseForMovieDetails
        }
        
        data = try? JSONSerialization.data(withJSONObject: response, options: .fragmentsAllowed)
//            debugPrint("StubResponseProvider -- get() -- response = \((try? JSONSerialization.jsonObject(with: data ?? Data([]), options: .allowFragments)) ?? NSDictionary())")
        
        return data
    }
}
