//
//  VNDetector.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/22.
//

import Foundation
import Vision

open class VNDetector: NSObject, VNDetectorProtocol, Closeable {
    open private(set) var isClosed: Bool
    
    public override init() {
        self.isClosed = false
    }
    
    public func process(pixelBuffer: CVPixelBuffer, orientation: CGImagePropertyOrientation, completionHandler: @escaping VNRequestCompletionHandler) throws {
        try ensureNotClosed()
        let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, orientation: orientation)
        let request = newRequest(completionHandler: completionHandler)
        try handler.perform([request])
    }
    
    @available(iOS 14.0, *)
    public func process(sampleBuffer: CMSampleBuffer, orientation: CGImagePropertyOrientation, completionHandler: @escaping VNRequestCompletionHandler) throws {
        try ensureNotClosed()
        let handler = VNImageRequestHandler(cmSampleBuffer: sampleBuffer, orientation: orientation)
        let request = newRequest(completionHandler: completionHandler)
        try handler.perform([request])
    }
    
    public func close() {
        if self.isClosed { return }
        self.isClosed = true
    }
    
    open func newRequest(completionHandler: @escaping VNRequestCompletionHandler) -> VNRequest {
        fatalError("buildRequest is not implemented")
    }
    
    private func ensureNotClosed() throws {
        if self.isClosed {
            throw CameraXError(code: "state-error", message: "VNDetector is closed", details: nil)
        }
    }
}

public protocol VNDetectorProtocol: NSObjectProtocol {
    func process(pixelBuffer: CVPixelBuffer, orientation: CGImagePropertyOrientation, completionHandler: @escaping VNRequestCompletionHandler) throws
    @available(iOS 14.0, *)
    func process(sampleBuffer: CMSampleBuffer, orientation: CGImagePropertyOrientation, completionHandler: @escaping VNRequestCompletionHandler) throws
}
