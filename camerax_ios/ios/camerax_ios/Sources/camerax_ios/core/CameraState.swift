//
//  CameraState.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/21.
//

import Foundation

@objc public enum CameraState: Int {
    case pendingOpen, opening, open, closing, closed
}
