//
//  CameraStateDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/22.
//

import Foundation

extension CameraState {
    var api: CameraStateApi {
        switch self {
        case .pendingOpen:
            return .pendingOpen
        case .opening:
            return .opening
        case .open:
            return .open
        case .closing:
            return .closing
        case .closed:
            return .closed
        }
    }
}
