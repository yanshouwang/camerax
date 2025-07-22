//
//  VNDetector.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/22.
//

import Foundation
import Vision

open class VNDetector: NSObject, VNDetectorProtocol {
    public let options: [VNImageOption : Any]
    
    public init(options: [VNImageOption : Any]) {
        self.options = options
    }
    
    public func process(pixelBuffer: CVPixelBuffer, orientation: CGImagePropertyOrientation, completionHandler: @escaping VNRequestCompletionHandler) throws {
        fatalError("process is not implemented")
    }
    
    @available(iOS 14.0, *)
    public func process(sampleBuffer: CMSampleBuffer, orientation: CGImagePropertyOrientation, completionHandler: @escaping VNRequestCompletionHandler) throws {
        fatalError("process is not implemented")
    }
}

public protocol VNDetectorProtocol: NSObjectProtocol {
    func process(pixelBuffer: CVPixelBuffer, orientation: CGImagePropertyOrientation, completionHandler: @escaping VNRequestCompletionHandler) throws
    @available(iOS 14.0, *)
    func process(sampleBuffer: CMSampleBuffer, orientation: CGImagePropertyOrientation, completionHandler: @escaping VNRequestCompletionHandler) throws
}
