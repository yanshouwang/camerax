//
//  CameraStateDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/22.
//

import Foundation

extension CameraState {
    var api: CameraStateApi {
        return switch self {
        case .pendingOpen: .pendingOpen
        case .opening: .opening
        case .open: .open
        case .closing: .closing
        case .closed: .closed
        }
    }
}
