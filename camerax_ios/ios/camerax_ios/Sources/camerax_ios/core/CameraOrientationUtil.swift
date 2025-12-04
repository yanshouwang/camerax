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
    
    /// Converts rotation constant values defined in {@link Surface} to their equivalent in
    /// degrees.
    /// - Parameter rotation: One of the rotation constant values from {@link Surface}.
    /// - Returns: The equivalent rotation value in degrees.
    public static func surfaceRotationToDegrees(_ rotation: Surface.Rotation) -> Int {
        return switch rotation {
        case .rotation0: 0
        case .rotation90: 90
        case .rotation180: 180
        case .rotation270: 270
        }
    }
    
    /// Converts rotation degrees to their equivalent in values defined in {@link Surface}.
    /// - Parameter degrees: degrees The rotation value in degrees.
    /// - Returns: One of the constant rotation values defined in {@link Surface}.
    /// - Throws: IllegalArgumentException If the provided rotation degrees doesn't fall into any one of those defined in {@link Surface}.
    public static func degreesToSurfaceRotation(_ degrees: Int) throws -> Surface.Rotation {
        return switch degrees {
        case 0: .rotation0
        case 90: .rotation90
        case 180: .rotation180
        case 270: .rotation270
        default: throw CameraXError(code: "illegal-argument-error", message: "Invalid sensor rotation: \(degrees)", details: nil)
        }
    }
    
    public static func getVideoOrientation(_ rotation: Surface.Rotation) -> AVCaptureVideoOrientation {
        return switch rotation {
        case .rotation0: .portrait
        case .rotation90: .landscapeRight
        case .rotation180: .portraitUpsideDown
        case .rotation270: .landscapeLeft
        }
    }
}
