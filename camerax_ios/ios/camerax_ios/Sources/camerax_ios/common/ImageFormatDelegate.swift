//
//  ImageFormatDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/15.
//

import Foundation

extension ImageFormat {
    var api: ImageFormatApi {
        switch self {
        case .yuv420_888:
            return .yuv420888
        case .rgba8888:
            return .rgba8888
        case .jpeg:
            return .jpeg
        case .depth16:
            return .depth16
        case .depthJpeg:
            return .depthJpeg
        case .depthPointCloud:
            return .depthPointCloud
        case .flexRgba8888:
            return .flexRgba8888
        case .flexRgb888:
            return .flexRgb888
        case .heic:
            return .heic
        case .heicUltraHdr:
            return .heicUltraHdr
        case .jpegR:
            return .jpegR
        case .nv16:
            return .nv16
        case .nv21:
            return .nv21
        case .androidPrivate:
            return .androidPrivate
        case .raw10:
            return .raw10
        case .raw12:
            return .raw12
        case .rawPrivate:
            return .rawPrivate
        case .rawSensor:
            return .rawSensor
        case .unknown:
            return .unknown
        case .y8:
            return .y8
        case .yCbCrP010:
            return .yCbCrP010
        case .yCbCrP210:
            return .yCbCrP210
        case .yuv422_888:
            return .yuv422888
        case .yuv444_888:
            return .yuv444888
        case .yuy2:
            return .yuy2
        case .yv12:
            return .yv12
        case .a8:
            return .a8
        case .la88:
            return .la88
        case .l8:
            return .l8
        case .opaque:
            return .opaque
        case .rgba1010102:
            return .rgba1010102
        case .rgba4444:
            return .rgba4444
        case .rgba5551:
            return .rgba5551
        case .rgbaF16:
            return .rgbaF16
        case .rgbx8888:
            return .rgbx8888
        case .rgb332:
            return .rgb332
        case .rgb565:
            return .rgb565
        case .rgb888:
            return .rgb888
        case .translucent:
            return .translucent
        case .transparent:
            return .transparent
        case .yCbCr420Sp:
            return .yCbCr420Sp
        case .yCbCr422I:
            return .yCbCr422I
        case .yCbCr422Sp:
            return .yCbCr422Sp
        }
    }
}
