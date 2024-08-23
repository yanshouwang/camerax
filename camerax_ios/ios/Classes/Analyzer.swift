//
//  Analyzer.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/8/22.
//

import Foundation
import UIKit
import Vision

@objc public protocol Analyzer: NSObjectProtocol {
    func analyze(imageProxy: ImageProxy)
}

@objc public class RawAnalyzer: NSObject, Analyzer {
    let onAnalyzed: (ImageProxy) -> Void
    
    @objc public init(onAnalyzed: @escaping (ImageProxy) -> Void) {
        self.onAnalyzed = onAnalyzed
    }
    
    public func analyze(imageProxy: ImageProxy) {
        onAnalyzed(imageProxy)
    }
}

@objc public class MLAnalyzer: NSObject, Analyzer {
    public func analyze(imageProxy: ImageProxy) {
        let orientation = getOrientation()
        let imageRequestHandler = VNImageRequestHandler(cvPixelBuffer: imageProxy.imageBuffer, orientation: orientation, options: [:])
        let request = VNDetectBarcodesRequest() { request, error in }
        do {
            try imageRequestHandler.perform([request])
        } catch {
            debugPrint("VNImageRequestHandler error \(error)")
        }
    }
    
    private func getOrientation() -> CGImagePropertyOrientation {
        let deviceOrientatioin = UIDevice.current.orientation
        switch deviceOrientatioin {
        case UIDeviceOrientation.portraitUpsideDown:  // Device oriented vertically, home button on the top
            return .left
        case UIDeviceOrientation.landscapeLeft:       // Device oriented horizontally, home button on the right
            return .upMirrored
        case UIDeviceOrientation.landscapeRight:      // Device oriented horizontally, home button on the left
            return .down
        case UIDeviceOrientation.portrait:            // Device oriented vertically, home button on the bottom
            return .up
        default:
            return .up
        }
    }
}
