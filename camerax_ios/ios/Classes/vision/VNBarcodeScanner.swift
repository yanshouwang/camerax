//
//  VNBarcodeScanner.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/22.
//

import Foundation
import Vision

public class VNBarcodeScanner: VNDetector {
    public override func process(pixelBuffer: CVPixelBuffer, orientation: CGImagePropertyOrientation, completionHandler: @escaping VNRequestCompletionHandler) throws {
        let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, orientation: orientation, options: self.options)
        let request = VNDetectBarcodesRequest(completionHandler: completionHandler)
        try handler.perform([request])
    }
    
    @available(iOS 14.0, *)
    public override func process(sampleBuffer: CMSampleBuffer, orientation: CGImagePropertyOrientation, completionHandler: @escaping VNRequestCompletionHandler) throws {
        let handler = VNImageRequestHandler(cmSampleBuffer: sampleBuffer, orientation: orientation, options: self.options)
        let request = VNDetectBarcodesRequest(completionHandler: completionHandler)
        try handler.perform([request])
    }
}
