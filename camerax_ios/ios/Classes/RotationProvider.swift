//
//  RotationProvider.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/8/23.
//

import Foundation

class RotationProvider: NSObject {
    private let INVALID_SURFACE_ROTATION = -1
    
    private var rotation: Int
    private var listeners: [RotationListener]
    
    lazy var orientationListener = OrientationEventListener() { orientation in
        if orientation == OrientationEventListener.ORIENTATION_UNKNOWN {
            // Short-circuit if orientation is unknown. Unknown rotation
            // can't be handled so it shouldn't be sent.
            return
        }
        let rotation = self.orientationToRotation(orientation)
        if rotation == self.rotation {
            return
        }
        debugPrint("Rotation changed \(rotation)")
        self.rotation = rotation
        for listener in self.listeners {
            listener.onRotationChanged(rotation)
        }
    }
    
    override init() {
        self.rotation = INVALID_SURFACE_ROTATION
        self.listeners = []
    }
    
    func addListener(_ listener: RotationListener) {
        if orientationListener.canDetectOrientation() && !listeners.contains(listener) {
            listeners.append(listener)
            orientationListener.enable()
        }
    }
    
    func removeListener(_ listener: RotationListener) {
        listeners.removeAll() { item in item === listener }
        if listeners.isEmpty {
            orientationListener.disable()
        }
    }
    
    private func orientationToRotation(_ orientation: Int) -> Int {
        if orientation >= 315 || orientation < 45 {
            return 0
        } else if orientation >= 225 {
            return 90
        } else if orientation >= 135 {
            return 180
        } else {
            return 270
        }
    }
}
