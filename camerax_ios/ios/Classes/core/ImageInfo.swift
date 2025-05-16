//
//  ImageInfo.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/15.
//

import Foundation

public class ImageInfo: NSObject {
    public let timestamp: Int
    public let rotationDegrees: Int
    
    init(timestamp: Int, rotationDegrees: Int) {
        self.timestamp = timestamp
        self.rotationDegrees = rotationDegrees
    }
}
