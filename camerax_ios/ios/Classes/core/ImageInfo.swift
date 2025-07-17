//
//  ImageInfo.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/15.
//

import Foundation
import AVFoundation

public class ImageInfo: NSObject {
    public let timestamp: CMTime
    public let rotationDegrees: Int
    
    init(timestamp: CMTime, rotationDegrees: Int) {
        self.timestamp = timestamp
        self.rotationDegrees = rotationDegrees
    }
}
