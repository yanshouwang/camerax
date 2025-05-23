//
//  TorchStateDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/16.
//

import Foundation

extension TorchState {
    var api: TorchStateApi {
        switch self {
        case .off:
            return .off
        case .on:
            return .on
        }
    }
}
