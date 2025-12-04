//
//  ImageFormat.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/8/22.
//

import Foundation
import CoreVideo

public enum ImageFormat: Int {
    case depth16,
         depthJpeg,
         depthPointCloud,
         flexRgba8888,
         flexRgb888,
         heic,
         heicUltraHdr,
         jpeg,
         jpegR,
         nv16,
         nv21,
         androidPrivate,
         raw10,
         raw12,
         rawPrivate,
         rawSensor,
         // rgb565,
         unknown,
         y8,
         yCbCrP010,
         yCbCrP210,
         yuv420_888,
         yuv422_888,
         yuv444_888,
         yuy2,
         yv12,
         // PixelFormat
         a8,
         // jpeg,
         la88,
         l8,
         opaque,
         rgba1010102,
         rgba4444,
         rgba5551,
         rgba8888,
         rgbaF16,
         rgbx8888,
         rgb332,
         rgb565,
         rgb888,
         translucent,
         transparent,
         // unknown,
         yCbCr420Sp,
         yCbCr422I,
         yCbCr422Sp
}

extension OSType {
    var imageFormatOrNil: ImageFormat? {
        return switch Int(self) {
        case Int(kCVPixelFormatType_420YpCbCr8BiPlanarFullRange): .yuv420_888
        case Int(kCVPixelFormatType_32BGRA): .rgba8888
        default: nil
        }
    }
}
