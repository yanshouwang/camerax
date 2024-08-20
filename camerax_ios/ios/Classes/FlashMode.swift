//
//  FlashMode.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/7/13.
//

import Foundation
import AVFoundation

@objc public enum FlashMode: Int {
    case auto
    case on
    case off
}

extension FlashMode {
    var swiftValue: AVCaptureDevice.FlashMode {
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
    var ffiValue: FlashMode {
        switch self {
        case .auto:
            return .auto
        case .on:
            return .on
        case .off:
            return .off
        @unknown default:
            return .off
        }
    }
}
