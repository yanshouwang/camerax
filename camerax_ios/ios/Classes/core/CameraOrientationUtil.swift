//
//  CameraOrientationUtil.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/17.
//

import Foundation
import AVFoundation

/// Contains utility methods related to camera orientation.
///
/// [Google Git](https://android.googlesource.com/platform/frameworks/support/+/androidx-main/camera/camera-core/src/main/java/androidx/camera/core/impl/utils/CameraOrientationUtil.java)
public class CameraOrientationUtil: NSObject {
    private override init() {}
    
    /// Calculates the delta between a source rotation and destination rotation.
    ///
    /// A typical use of this method would be calculating the angular difference between the display orientation (destRotationDegrees) and camera sensor orientation (sourceRotationDegrees).
    /// - Parameters:
    ///   - destRotationDegrees: The destination rotation relative to the device's natural rotation.
    ///   - sourceRotationDegrees: The source rotation relative to the device's natural rotation.
    ///   - isOppositeFacing: Whether the source and destination planes are facing opposite directions.
    /// - Returns: The relative image rotation
    public static func getRelativeImageRotation(destRotationDegrees: Int, sourceRotationDegrees: Int, isOppositeFacing: Bool) -> Int {
        if isOppositeFacing {
            return (sourceRotationDegrees - destRotationDegrees + 360) % 360
        } else {
            return (sourceRotationDegrees + destRotationDegrees) % 360
        }
    }
    
    public static func getVideoOrientation(_ rotation: Int) -> AVCaptureVideoOrientation? {
        switch rotation {
        case 0:
            return .portrait
        case 90:
            return .landscapeRight
        case 180:
            return .portraitUpsideDown
        case 270:
            return .landscapeLeft
        default:
            return nil
        }
    }
}
