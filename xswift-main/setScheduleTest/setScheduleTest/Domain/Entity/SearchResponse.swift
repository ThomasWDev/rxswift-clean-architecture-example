//
//  Entity.swift
//  setScheduleTest
//
//  Created by Thomas Woodfin on 31/10/21.
//

import Foundation

/* Wrapper response of search api, which has array of dynamic search content like - movie */
public struct SearchResponse<T: Codable>: Codable {
    public let page: Int?
    public let results: [T]?
    public let totalPages: Int?
    public let totalResults: Int?
    
    public init(page: Int? = nil, results: [T]? = nil, totalPages: Int? = nil, totalResults: Int? = nil) {
        self.page = page
        self.results = results
        self.totalPages = totalPages
        self.totalResults = totalResults
    }
    
    public enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
