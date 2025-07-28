//
//  File.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/7/13.
//

import Foundation
import AVFoundation

public class ImageProxy: NSObject, AutoCloseable {
    private let onClosed: () -> Void
    private(set) var isClosed: Bool
    
    init(onClosed: @escaping () -> Void) {
        self.isClosed = false
        self.onClosed = onClosed
    }
    
    public func getFormat() throws -> ImageFormat {
        fatalError("getFormat is not implemented")
    }
    
    public func getWidth() throws -> Int {
        fatalError("getWidth is not implemented")
    }
    
    public func getHeight() throws -> Int {
        fatalError("getHeight is not implemented")
    }
    
    public func getPlanes() throws -> [PlaneProxy] {
        fatalError("getPlanes is not implemented")
    }
    
    public func getImageInfo() throws -> ImageInfo {
        fatalError("getImageInfo is not implemented")
    }
    
    public func getSampleBuffer() -> CMSampleBuffer? {
        return nil
    }
    
    public func getImage() -> CGImage? {
        return nil
    }
    
    public func close() {
        if self.isClosed { return }
        self.isClosed = true
        onClosed()
    }
    
    public class PlaneProxy: NSObject {
        func getValue() throws -> Data {
            fatalError("getValue is not implemented")
        }
        
        func getPixelStride() throws -> Int {
            fatalError("getPixelStride is not implemented")
        }
        
        func getRowStride() throws -> Int {
            fatalError("getRowStride is not implemented")
        }
    }
}
