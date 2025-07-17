//
//  ImageCapture.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/15.
//

import Foundation
import AVFoundation
import CoreLocation

public class ImageCapture: NSObject {
    public enum FlashMode: Int {
        case auto, on, off
    }
    
    public protocol OnImageCapturedCallback: NSObjectProtocol {
        func onCaptureStarted() -> Void
        func onCaptureProcessProgressed(_ progress: Int) -> Void
        func onPostviewBitmapAvailable(_ bitmap: Data) -> Void
        func onCaptureSuccess(_ image: ImageProxy) -> Void
        func onError(_ error: Error) -> Void
    }
}

extension ImageCapture.FlashMode {
    var impl: AVCaptureDevice.FlashMode {
        switch self {
        case .auto:
            return .auto
        case .on:
            return .on
        case .off:
            return .off
        }
    }
}

extension AVCaptureDevice.FlashMode {
    var api: ImageCapture.FlashMode {
        switch self {
        case .auto:
            return .auto
        case .on:
            return .on
        case .off:
            return .off
        @unknown default:
            fatalError()
        }
    }
}
