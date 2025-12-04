//
//  TorchStateDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/16.
//

import Foundation

extension TorchState {
    var api: TorchStateApi {
        return switch self {
        case .off: .off
        case .on: .on
        }
    }
}
