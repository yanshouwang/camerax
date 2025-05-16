//
//  VNAnalyzer.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/15.
//

import Foundation
import Vision

public class VNAnalyzer: NSObject, ImageAnalysis.Analyzer {
    public func analyze(_ image: ImageProxy) {
        let orientation = getOrientation()
        let imageRequestHandler = VNImageRequestHandler(cvPixelBuffer: image.buffer, orientation: orientation, options: [:])
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
