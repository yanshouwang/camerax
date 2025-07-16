//
//  RotationProvider.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/8/23.
//

import Foundation

public class RotationProvider: NSObject {
    private let INVALID_SURFACE_ROTATION = -1
    
    private var rotation: Int
    private var listeners: [Listener]
    
    lazy var orientationListener = OrientationEventListener() { orientation in
        if orientation == OrientationEventListener.ORIENTATION_UNKNOWN {
            // Short-circuit if orientation is unknown. Unknown rotation
            // can't be handled so it shouldn't be sent.
            return
        }
        let rotation = self.orientationToSurfaceRotation(orientation)
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
    
    public func addListener(_ listener: Listener) {
        if orientationListener.canDetectOrientation() && !listeners.contains(listener) {
            listeners.append(listener)
            orientationListener.enable()
        }
    }
    
    public func removeListener(_ listener: Listener) {
        listeners.removeAll() { item in item === listener }
        if listeners.isEmpty {
            orientationListener.disable()
        }
    }
    
    private func orientationToSurfaceRotation(_ orientation: Int) -> Int {
        debugPrint("orientation: \(orientation)")
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
    
    public class Listener: NSObject {
        internal let onRotationChanged: (Int) -> Void

        init(onRotationChanged: @escaping (Int) -> Void) {
            self.onRotationChanged = onRotationChanged
        }
    }
}
