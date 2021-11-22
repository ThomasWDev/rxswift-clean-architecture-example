//
//  Movie.swift
//  setScheduleTest
//
//  Created by Thomas Woodfin on 31/10/21.
//

import Foundation

/* Movie entity of search response */
struct Movie: Codable {
    public let id: Int?
    public let originalTitle: String?
    public let overview: String?
    public let popularity: Float?
    public let posterPath: String?
    public let releaseDate: String?
    public let title: String?
    public let voteAverage: Float?
    public let voteCount: Int?
    
    init(id: Int? = nil, originalTitle: String? = nil, overview: String? = nil, popularity: Float? = nil, posterPath: String? = nil, releaseDate: String? = nil, title: String? = nil, voteAverage: Float? = nil, voteCount: Int? = nil) {
        self.id = id
        self.originalTitle = originalTitle
        self.overview = overview
        self.popularity = popularity
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.title = title
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case originalTitle = "original_title"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title = "title"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    public var asCellViewModel: AbstractCellViewModel {
        return SearchCellViewModel(id: id, thumbnail: "\(AppConfig.shared.getServerConfig().getMediaBaseUrl())/\(posterPath ?? "" )", title: title, overview: overview)
    }
}


