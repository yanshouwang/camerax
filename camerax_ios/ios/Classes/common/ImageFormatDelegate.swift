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
        case .yuv420888:
            return .yuv420888
        case .rgba8888:
            return .rgba8888
        case .jpeg:
            return .jpeg
        }
    }
}

extension ImageFormatApi {
    var delegate: ImageFormat {
        switch self {
        case .yuv420888:
            return .yuv420888
        case .rgba8888:
            return .rgba8888
        case .jpeg:
            return .jpeg
        }
    }
}
