//
//  FFI.X.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/8/22.
//

import Foundation
import AVFoundation

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

extension ImageFormat {
    var swiftValue: Int {
        switch self {
        case .yuv_420_888:
            return Int(kCVPixelFormatType_420YpCbCr8BiPlanarVideoRange)
        case .rgba_8888:
            return Int(kCVPixelFormatType_32BGRA)
        }
    }
}

extension OSType {
    var ffiImageFormat: ImageFormat {
        return Int(self).ffiImageFormat
    }
}

extension Int {
    var ffiImageFormat: ImageFormat {
        switch self {
        case Int(kCVPixelFormatType_420YpCbCr8BiPlanarVideoRange):
            return .yuv_420_888
        case Int(kCVPixelFormatType_32BGRA):
            return .rgba_8888
        default:
            return .yuv_420_888
        }
    }
}

extension LensFacing {
    var swiftValue: AVCaptureDevice.Position {
        switch self {
        case .front:
            return .front
        case .back:
            return .back
        default:
            return .unspecified
        }
    }
}

extension ScaleType {
    var swiftValue: AVLayerVideoGravity {
        switch self {
        case .fill:
            return .resize
        case .fillCenter:
            return .resizeAspectFill
        case .fitCenter:
            return .resizeAspect
        }
    }
}

extension AVLayerVideoGravity {
    var ffiValue: ScaleType {
        switch self {
        case .resizeAspectFill:
            return .fillCenter
        case .resizeAspect:
            return .fitCenter
        default:
            return .fill
        }
    }
}

extension CMTime {
    var milliseconds: Int {
       return Int(self.seconds * 1000)
    }
}
