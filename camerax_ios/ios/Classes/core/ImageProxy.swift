//
//  File.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/7/13.
//

import Foundation
import AVFoundation

public class ImageProxy: NSObject, AutoCloseable {
    internal let buffer: CVImageBuffer
    
    public let format: ImageFormat
    public let width: Int
    public let height: Int
    public let planes: [PlaneProxy]
    public let imageInfo: ImageInfo
    
    init(buffer: CVImageBuffer, format: ImageFormat, width: Int, height: Int, planes: [PlaneProxy], imageInfo: ImageInfo) {
        self.buffer = buffer
        self.format = format
        self.width = width
        self.height = height
        self.planes = planes
        self.imageInfo = imageInfo
    }
    
    public func close() {
        CVPixelBufferUnlockBaseAddress(buffer, .readOnly)
    }
    
    public class PlaneProxy: NSObject {
        public let data: Data
        public let rowStride: Int
        public let pixelStride: Int
        
        init(data: Data, rowStride: Int, pixelStride: Int) {
            self.data = data
            self.rowStride = rowStride
            self.pixelStride = pixelStride
        }
    }
}
