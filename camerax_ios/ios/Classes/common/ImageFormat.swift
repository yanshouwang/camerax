//
//  ImageFormat.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/8/22.
//

import Foundation

public enum ImageFormat: Int {
    case yuv420888, rgba8888, jpeg
}

extension ImageFormat {
    var impl: Int {
        switch self {
        case .yuv420888:
            return Int(kCVPixelFormatType_420YpCbCr8BiPlanarFullRange)
        case .rgba8888:
            return Int(kCVPixelFormatType_32BGRA)
        case .jpeg:
            fatalError()
        }
    }
}

extension OSType {
    var imageFormatApi: ImageFormat {
        return Int(self).imageFormatApi
    }
}

extension Int {
    var imageFormatApi: ImageFormat {
        switch self {
        case Int(kCVPixelFormatType_420YpCbCr8BiPlanarFullRange):
            return .yuv420888
        case Int(kCVPixelFormatType_32BGRA):
            return .rgba8888
        default:
            fatalError()
        }
    }
}
