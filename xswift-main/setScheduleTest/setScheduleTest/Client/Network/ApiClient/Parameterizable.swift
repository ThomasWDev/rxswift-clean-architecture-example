//
//  Parameterizable.swift
//  tawktestios
//
//  Created by Thomas Woodfin on 7/24/21.
//

import Foundation


public protocol Parameterizable {
    var asRequestParam: [String: Any] { get }
}

