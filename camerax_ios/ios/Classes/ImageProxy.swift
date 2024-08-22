//
//  File.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/7/13.
//

import Foundation
import AVFoundation

@objc public class ImageProxy: NSObject {
    let imageBuffer: CVImageBuffer
    
    @objc public let format: ImageFormat
    @objc public let width: Int
    @objc public let height: Int
    @objc public let rotationDegrees: Int
    @objc public let planeProxies: [PlaneProxy]
    @objc public let timestamp: Int
    
    init(imageBuffer: CVImageBuffer, format: ImageFormat, width: Int, height: Int, rotationDegrees: Int, planeProxies: [PlaneProxy], timestamp: Int) {
        self.imageBuffer = imageBuffer
        self.format = format
        self.width = width
        self.height = height
        self.rotationDegrees = rotationDegrees
        self.planeProxies = planeProxies
        self.timestamp = timestamp
    }
    
    @objc public func close() {
        CVPixelBufferUnlockBaseAddress(imageBuffer, .readOnly)
    }
}
