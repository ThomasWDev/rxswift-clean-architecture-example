//
//  MovieRequestParameter.swift
//  setScheduleTest
//
//  Created by Thomas Woodfin 2/15/21.
//

import Foundation
import Foundation


struct MovieDetailsParams: Parameterizable{
    let apiKey: String = AppConfig.shared.getServerConfig().setAuthCredential().apiKey ?? ""
    let movieId: Int

    public init(movieId: Int) {
        self.movieId = movieId
    }

    private enum CodingKeys: String, CodingKey {
        case apiKey = "api_key"
        case movieId = "movie_id"
    }

    public var asRequestParam: [String: Any] {
        let param: [String: Any] = [CodingKeys.apiKey.rawValue: apiKey, CodingKeys.movieId.rawValue: movieId]
        return param.compactMapValues { $0 }
    }
}
