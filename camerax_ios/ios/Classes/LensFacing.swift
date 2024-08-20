//
//  LensFacing.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/7/12.
//

import Foundation
import AVFoundation

@objc public enum LensFacing: Int {
    case front
    case back
    case external
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
