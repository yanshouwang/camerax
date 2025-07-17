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
    
    public func enable() {
        orientationListener.enable()
    }
    
    public func disable() {
        orientationListener.disable()
    }
    
    public func getRotation() -> Int {
        return rotation
    }
    
    public func addListener(_ listener: Listener) {
        guard orientationListener.canDetectOrientation() && !listeners.contains(where: { $0 === listener }) else { return }
        listeners.append(listener)
    }
    
    public func removeListener(_ listener: Listener) {
        listeners.removeAll() { $0 === listener }
    }
    
    private func orientationToSurfaceRotation(_ orientation: Int) -> Int {
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
        fileprivate let onRotationChanged: (Int) -> Void
        
        init(onRotationChanged: @escaping (Int) -> Void) {
            self.onRotationChanged = onRotationChanged
        }
    }
}
