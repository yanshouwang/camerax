//
//  ImageFormatDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/15.
//

import Foundation

extension ImageFormat {
    var api: ImageFormatApi {
        return switch self {
        case .yuv420_888: .yuv420888
        case .rgba8888: .rgba8888
        case .jpeg: .jpeg
        case .depth16: .depth16
        case .depthJpeg: .depthJpeg
        case .depthPointCloud: .depthPointCloud
        case .flexRgba8888: .flexRgba8888
        case .flexRgb888: .flexRgb888
        case .heic: .heic
        case .heicUltraHdr: .heicUltraHdr
        case .jpegR: .jpegR
        case .nv16: .nv16
        case .nv21: .nv21
        case .androidPrivate: .androidPrivate
        case .raw10: .raw10
        case .raw12: .raw12
        case .rawPrivate: .rawPrivate
        case .rawSensor: .rawSensor
        case .unknown: .unknown
        case .y8: .y8
        case .yCbCrP010: .yCbCrP010
        case .yCbCrP210: .yCbCrP210
        case .yuv422_888: .yuv422888
        case .yuv444_888: .yuv444888
        case .yuy2: .yuy2
        case .yv12: .yv12
        case .a8: .a8
        case .la88: .la88
        case .l8: .l8
        case .opaque: .opaque
        case .rgba1010102: .rgba1010102
        case .rgba4444: .rgba4444
        case .rgba5551: .rgba5551
        case .rgbaF16: .rgbaF16
        case .rgbx8888: .rgbx8888
        case .rgb332: .rgb332
        case .rgb565: .rgb565
        case .rgb888: .rgb888
        case .translucent: .translucent
        case .transparent: .transparent
        case .yCbCr420Sp: .yCbCr420Sp
        case .yCbCr422I: .yCbCr422I
        case .yCbCr422Sp: .yCbCr422Sp
        }
    }
}
