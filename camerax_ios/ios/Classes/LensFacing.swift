//
//  LensFacing.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/7/12.
//

import Foundation
import AVFoundation

enum LensFacing {
    case front
    case back
    case external
}

extension LensFacing {
    var avPosition: AVCaptureDevice.Position {
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
