//
//  ScaleType.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/7/12.
//

import Foundation
import AVFoundation

@objc public enum ScaleType: Int {
    case fill
    case fillCenter
    case fitCenter
}

extension ScaleType {
    var avfValue: AVLayerVideoGravity {
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
    var xValue: ScaleType {
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
