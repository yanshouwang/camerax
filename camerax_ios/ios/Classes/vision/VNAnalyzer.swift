//
//  VNAnalyzer.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/15.
//

import Foundation
import Vision

public class VNAnalyzer: NSObject, ImageAnalysis.Analyzer {
    private let requests: [VNRequest]
    private let consumer: any Consumer<VNAnalyzer.Result>
    
    public init(requests: [VNRequest], consumer: any Consumer<VNAnalyzer.Result>) {
        self.requests = requests
        self.consumer = consumer
    }
    
    public func analyze(_ image: ImageProxy) {
//        do {
//            let imageRequestHandler = VNImageRequestHandler(cvPixelBuffer: image.buffer, orientation: image.orientation, options: [:])
//            try imageRequestHandler.perform(requests)
//        } catch {
//            debugPrint("VNImageRequestHandler error \(error)")
//        }
    }
    
    public class Result: NSObject {
        private let timestamp: CMTime
        private let values: [VNRequest: [VNObservation]]
        private let errors: [VNRequest: Error]
        
        init(timestamp: CMTime, values: [VNRequest : [VNObservation]], errors: [VNRequest : Error]) {
            self.timestamp = timestamp
            self.values = values
            self.errors = errors
        }
        
        public func getTimestamp() -> CMTime {
            return timestamp
        }
        
        public func getValue(_ request: VNRequest) throws -> [VNObservation] {
            try checkRequestExists(request)
            guard let value = values[request] else {
                throw CameraXError(code: "nil-error", message: "value is nil", details: nil)
            }
            return value
        }
        
        public func getError(_ request: VNRequest) throws -> Error? {
            try checkRequestExists(request)
            return errors[request]
        }
        
        private func checkRequestExists(_ request: VNRequest) throws {
            guard values.keys.contains(request) || errors.keys.contains(request) else {
                throw CameraXError(code: "nil-error", message: "The request does not exist", details: nil)
            }
        }
    }
}

fileprivate extension ImageProxy {
    var orientation: CGImagePropertyOrientation {
        switch self.imageInfo.rotationDegrees {
        case 0:
            return .up
        case 90:
            return .right
        case 180:
            return .down
        case 270:
            return .left
        default:
            return .up
        }
    }
}
