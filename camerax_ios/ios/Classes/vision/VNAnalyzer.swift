//
//  VNAnalyzer.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/15.
//

import Foundation
import Vision

public class VNAnalyzer: NSObject, ImageAnalysis.Analyzer {
    private let detectors: [VNDetector]
    private let consumer: any Consumer<VNAnalyzer.Result>
    
    init(detectors: [VNDetector], consumer: any Consumer<VNAnalyzer.Result>) {
        self.detectors = detectors
        self.consumer = consumer
    }
    
    public func analyze(_ image: ImageProxy) {
        // Detect the image recursively, starting from index 0.
        self.detectRecursively(image, 0, [:], [:]);
    }
    
    private func detectRecursively(_ imageProxy: ImageProxy, _ index: Int, _ values: [VNDetector : [VNObservation]], _ errors: [VNDetector : Error]) {
        guard let imageInfo = try? imageProxy.getImageInfo(), let sampleBuffer = imageProxy.getSampleBuffer(), let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {
            // No-op if the frame is not backed by ImageProxy.
            debugPrint("imageInfo is nil")
            imageProxy.close()
            return
        }
        if index > self.detectors.count - 1 {
            // Termination condition is met when the index reaches the end of the list.
            let timestamp = imageInfo.timestamp
            let result = Result(timestamp: timestamp, values: values, errors: errors)
            self.consumer.accept(result)
            imageProxy.close()
            return
        }
        var newValues = values
        var newErrors = errors
        let detector = self.detectors[index]
        let orientation = imageInfo.orientation
        do {
            try detector.process(pixelBuffer: pixelBuffer, orientation: orientation) { request, error in
                // Record the return value / exception.
                if let error {
                    newErrors[detector] = error
                } else {
                    newValues[detector] = request.results
                }
                // Go to the next detector.
                self.detectRecursively(imageProxy, index + 1, newValues, newErrors);
            }
        } catch {
            // If the detector is closed, it will throw a MlKitException.UNAVAILABLE. It's not
            // public in the "mlkit:vision-interfaces" artifact so we have to catch a generic
            // Exception here.
            newErrors[detector] = error
            // This detector is closed, but the next one might still be open. Send the image to
            // the next detector.
            self.detectRecursively(imageProxy, index + 1, newValues, newErrors);
        }
    }
    
    public class Result: NSObject {
        private let timestamp: CMTime
        private let values: [VNDetector: [VNObservation]?]
        private let errors: [VNDetector: Error]
        
        init(timestamp: CMTime, values: [VNDetector : [VNObservation]?], errors: [VNDetector : Error]) {
            self.timestamp = timestamp
            self.values = values
            self.errors = errors
        }
        
        public func getTimestamp() -> CMTime {
            return timestamp
        }
        
        public func getValue(_ detector: VNDetector) throws -> [VNObservation]? {
            try checkDetectorExists(detector)
            return values[detector] ?? nil
        }
        
        public func getError(_ detector: VNDetector) throws -> Error? {
            try checkDetectorExists(detector)
            return errors[detector]
        }
        
        private func checkDetectorExists(_ detector: VNDetector) throws {
            guard values.contains(where: { $0.key === detector }) || errors.contains(where: { $0.key === detector }) else {
                throw CameraXError(code: "nil-error", message: "The detector does not exist", details: nil)
            }
        }
    }
}

fileprivate extension ImageInfo {
    var orientation: CGImagePropertyOrientation {
        switch self.rotationDegrees {
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
