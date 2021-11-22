//
//  UIImageView+Extension.swift
//  tawktestios
//
//  Created by Thomas Woodfin on 7/28/21.
//

import UIKit

extension UIImageView {
    func loadImage(from url: String, placeholderImage: UIImage? = UIImage(named: "img_avatar"), completionHandler: @escaping (DownloadCompletionHandler<UIImage>)){
        
//        self.image = placeholderImage
        ImageDownloader.shared.download(with: url, completionHandler: completionHandler, placeholder: placeholderImage)
    }
}

