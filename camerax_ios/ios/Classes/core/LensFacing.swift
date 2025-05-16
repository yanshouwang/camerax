//
//  LensFacing.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/7/12.
//

import Foundation
import AVFoundation

public enum LensFacing: Int {
    case unknown, front, back, external
}

extension LensFacing {
    var impl: AVCaptureDevice.Position {
        switch self {
        case .unknown:
            fatalError()
        case .front:
            return .front
        case .back:
            return .back
        default:
            return .unspecified
        }
    }
}
