//
//  AbstractDataModel.swift
//  tawktestios
//
//  Created by Thomas Woodfin on 5/8/21.
//

import Foundation


/*
 Base class for our server response
 */

public protocol AbstractDataModel: AnyObject {
    var id: Int? {get set}
    
    //dictionary representation of this model 
    var asDictionary : [String: Any]? {get}
}

