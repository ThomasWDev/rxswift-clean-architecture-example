//
//  GithubUserParams.swift
//  tawktestios
//
//  Created by Thomas Woodfin on 7/24/21.
//

import Foundation


struct MoviewSearchParams: Parameterizable{
    let apiKey: String = AppConfig.shared.getServerConfig().setAuthCredential().apiKey ?? ""
    let query: String
    let year: Int

    public init(query: String, year: Int) {
        self.query = query
        self.year = year
    }

    private enum CodingKeys: String, CodingKey {
        case apiKey = "api_key"
        case query = "query"
        case year = "year"
    }

    public var asRequestParam: [String: Any] {
        let param: [String: Any] = [CodingKeys.apiKey.rawValue: apiKey, CodingKeys.query.rawValue: query, CodingKeys.year.rawValue: year]
        return param.compactMapValues { $0 }
    }
}
