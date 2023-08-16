//
//  WallpaperPack.swift
//  MacDynamicDesktop
//
//  Created by Lars Krämer on 15.08.23.
//

import Foundation

class WallpaperPack: Identifiable {
    var Name: String
    var Images: [String]
    var PreviewImage: String
    
    init(name: String, images: [String], previewImage: String? = nil) {
        Name = name;
        Images = images
        
        if previewImage == nil, let firstImage = images.first {
            PreviewImage = firstImage
        } else {
            PreviewImage = previewImage!
        }
    }
}
