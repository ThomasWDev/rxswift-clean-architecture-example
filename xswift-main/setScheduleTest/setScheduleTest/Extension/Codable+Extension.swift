//
//  Codable+Extension.swift
//  tawktestios
//
//  Created by Thomas Woodfin on 8/28/21.
//

import Foundation

extension Encodable {

    var asDictionary : [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        guard let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any] else { return nil }
        return json
    }
}
