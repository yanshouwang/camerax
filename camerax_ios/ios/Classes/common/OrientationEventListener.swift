//
//  OrientationEventListener.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/8/23.
//

import Foundation
import CoreMotion

public class OrientationEventListener: NSObject {
    public static let ORIENTATION_UNKNOWN = -1

    private let motionManger: CMMotionManager
    private var enabled: Bool
    private var orientation: Int
    private var onOrientationChanged: (Int) -> Void
    
    public init(onOrientationChanged: @escaping (Int) -> Void) {
        self.motionManger = CMMotionManager()
        self.enabled = false
        self.orientation = OrientationEventListener.ORIENTATION_UNKNOWN
        self.onOrientationChanged = onOrientationChanged
    }
    
    public func canDetectOrientation() -> Bool {
        return self.motionManger.isAccelerometerAvailable
    }
    
    public func enable() {
        guard !self.enabled else { return }
        debugPrint("OrientationEventListener enabled")
        self.motionManger.startAccelerometerUpdates(to: .main) { data, error in
            guard let accelerometerData = data, error == nil else { return }
            var orientation = OrientationEventListener.ORIENTATION_UNKNOWN
            let acceleration = accelerometerData.acceleration
            let x = acceleration.x * 9.81
            let y = acceleration.y * 9.81
            let z = acceleration.z * 9.81
            let magnitude = x * x + y * y
            // Don't trust the angle if the magnitude is small compared to the y value
            if magnitude * 4 >= z * z {
                let oneEightyOverPi = 57.29577957855
                var angle = atan2(-y, x) * oneEightyOverPi
                angle.round()
                orientation = 90 - Int(angle)
                // Normalize to 0 - 359 range
                while orientation >= 360 {
                    orientation -= 360
                }
                while orientation < 0 {
                    orientation += 360
                }
            }
            guard self.orientation != orientation else { return }
            self.orientation = orientation
            self.onOrientationChanged(orientation)
        }
        self.enabled = true
    }
    
    public func disable() {
        guard self.enabled else { return }
        debugPrint("OrientationEventListener disabled")
        self.motionManger.stopAccelerometerUpdates()
        self.enabled = false
    }
}
