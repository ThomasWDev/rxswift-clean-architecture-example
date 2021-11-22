//
//  SearchCellViewModel.swift
//  setScheduleTest
//
//  Created by Thomas Woodfin on 4/11/21.
//

import Foundation


protocol AbstractCellViewModel: AnyObject {
    var id: Int? {set get}
    var thumbnail: String? {set get}
    var title: String? {set get}
    var overview: String? {set get}
}

class SearchCellViewModel: AbstractCellViewModel {
    var id: Int?
    var thumbnail: String?
    var title: String?
    var overview: String?
    
    init(id: Int? = nil, thumbnail: String? = nil, title: String? = nil, overview: String? = nil) {
        self.id = id
        self.thumbnail = thumbnail
        self.title = title
        self.overview = overview
    }
}

