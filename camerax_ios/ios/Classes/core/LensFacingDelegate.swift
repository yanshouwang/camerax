//
//  LensFacingDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/16.
//

import Foundation

extension LensFacingApi {
    var delegate: LensFacing {
        switch self {
        case .unknown:
            return .unknown
        case .front:
            return .front
        case .back:
            return .back
        case .external:
            return .external
        }
    }
}
