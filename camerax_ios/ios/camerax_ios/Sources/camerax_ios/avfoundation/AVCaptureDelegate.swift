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
    var api: AVCaptureDeviceCinematicVideoFocusModeApi? {
        return switch self {
        case .none: AVCaptureDeviceCinematicVideoFocusModeApi.none
        case .strong: .strong
        case .weak: .weak
        @unknown default: nil
        }
    }
}
