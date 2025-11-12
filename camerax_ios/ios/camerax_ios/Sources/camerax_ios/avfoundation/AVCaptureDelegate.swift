//
//  File.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/11/12.
//

import Foundation
import AVFoundation

@available(iOS 26.0, *)
extension AVCaptureDevice.CinematicVideoFocusMode {
    var api: AVCaptureDeviceCinematicVideoFocusModeApi {
        switch self {
        case .none:
            return .none
        case .strong:
            return .strong
        case .weak:
            return .weak
        }
    }
}
