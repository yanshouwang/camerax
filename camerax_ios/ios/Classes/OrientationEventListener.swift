//
//  OrientationEventListener.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/8/23.
//

import Foundation
import CoreMotion

class OrientationEventListener: NSObject {
    static let ORIENTATION_UNKNOWN = -1

    private let motionManger: CMMotionManager
    private var enabled: Bool
    private var orientation: Int
    private var onOrientationChanged: (Int) -> Void
    
    init(onOrientationChanged: @escaping (Int) -> Void) {
        self.motionManger = CMMotionManager()
        self.enabled = false
        self.orientation = OrientationEventListener.ORIENTATION_UNKNOWN
        self.onOrientationChanged = onOrientationChanged
    }
    
    func canDetectOrientation() -> Bool {
        return motionManger.isAccelerometerAvailable
    }
    
    func enable() {
        if enabled {
            return
        }
        debugPrint("OrientationEventListener enabled")
        motionManger.startAccelerometerUpdates(to: .main) { [self] data, error in
            guard let accelerometerData = data, error == nil else {
                return
            }
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
            if orientation == self.orientation {
                return
            }
            self.orientation = orientation
            self.onOrientationChanged(orientation)
        }
        enabled = true
    }
    
    func disable() {
        if !enabled {
            return
        }
        debugPrint("OrientationEventListener disabled")
        motionManger.stopAccelerometerUpdates()
        enabled = false
    }
}
