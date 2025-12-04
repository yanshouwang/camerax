//
//  ImageCapture.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/15.
//

import Foundation
import AVFoundation
import CoreGraphics
import CoreLocation

public class ImageCapture: NSObject {
    public enum FlashMode: Int {
        case auto, on, off
    }
    
    public protocol OnImageCapturedCallback: NSObjectProtocol {
        func onCaptureStarted() -> Void
        func onCaptureProcessProgressed(_ progress: Int) -> Void
        func onPostviewBitmapAvailable(_ bitmap: CGImage) -> Void
        func onCaptureSuccess(_ image: ImageProxy) -> Void
        func onError(_ error: Error) -> Void
    }
}

extension ImageCapture.FlashMode {
    var avFlashMode: AVCaptureDevice.FlashMode {
        return switch self {
        case .auto: .auto
        case .on: .on
        case .off: .off
        }
    }
}

extension AVCaptureDevice.FlashMode {
    var cxFlashModeOrNil: ImageCapture.FlashMode? {
        return switch self {
        case .auto: .auto
        case .on: .on
        case .off: .off
        @unknown default: nil
        }
    }
}
