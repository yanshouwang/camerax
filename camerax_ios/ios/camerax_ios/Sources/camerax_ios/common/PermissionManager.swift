//
//  PermissionManager.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/14.
//

import Foundation
import AVFoundation

public class PermissionManager: NSObject {
    public static let shared = PermissionManager()
    
    private override init() {}
    
    public override class func copy() -> Any {
        return self
    }
    
    public override class func mutableCopy() -> Any {
        return self
    }
    
    public func checkPermission(_ permission: Permission) -> Bool {
        return switch permission {
        case .video: AVCaptureDevice.authorizationStatus(for: .video) == .authorized
        case .audio: AVCaptureDevice.authorizationStatus(for: .audio) == .authorized
        }
    }
    
    public func requestPermissions(_ permissions: [Permission], completionHandler handler: @escaping (Bool) -> Void) {
        func recursive(_ index: Int, _ isGranted: Bool) {
            if index < permissions.count && isGranted {
                requestPermission(permissions[index]) { recursive(index + 1, $0) }
            } else {
                handler(isGranted)
            }
        }
        recursive(0, true)
    }
    
    public func requestPermission(_ permission: Permission, completionHandler handler: @escaping (Bool) -> Void) {
        switch permission {
        case .video:
            AVCaptureDevice.requestAccess(for: .video, completionHandler: handler)
        case .audio:
            AVCaptureDevice.requestAccess(for: .audio, completionHandler: handler)
        }
    }
    
    public enum Permission: Int {
        case video, audio
    }
}
