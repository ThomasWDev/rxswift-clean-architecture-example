//
//  DownloadDataParser.swift
//  tawktestios
//
//  Created by Thomas Woodfin on 17/8/21.
//

import UIKit


public class DownloadDataParser<T> {
    public static func getObjectAsType(data: Data) -> T? {
        var output: T?
        
        if T.self is UIImage.Type  {
            output = UIImage(data: data)?.decodedImage() as? T
        }

        return output
    }
}
