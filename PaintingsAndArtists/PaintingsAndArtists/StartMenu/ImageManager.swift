//
//  ImageManager.swift
//  PaintingsAndArtists
//
//  Created by Normand Martin on 2018-07-24.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import UIKit
class ImageManager {
    class func choosImage(imageView: UIImageView, imageName: String) {
        let image = UIImage(named: imageName)
        imageView.image = image
    }

    
}
