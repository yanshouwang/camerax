//
//  PermissionManager.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/14.
//

import Foundation
import AVFoundation
import Photos

public class PermissionManager: NSObject {
    public static let shared = PermissionManager()
    
    private override init() {}
    
    public override class func copy() -> Any {
        return self
    }
    
    public override class func mutableCopy() -> Any {
        return self
    }
    
    public func checkPermission(permission: Permission) -> Bool {
        switch permission {
        case .video:
            return AVCaptureDevice.authorizationStatus(for: .video) == .authorized
        case .audio:
            return AVCaptureDevice.authorizationStatus(for: .audio) == .authorized
        case .album:
            if #available(iOS 14.0, *) {
                return PHPhotoLibrary.authorizationStatus(for: .readWrite) == .authorized
            } else {
                return PHPhotoLibrary.authorizationStatus() == .authorized
            }
        }
    }
    
    public func requestPermissions(permissions: [Permission], completionHandler handler: @escaping (Bool) -> Void) {
        func recursive(index: Int, isGranted: Bool) {
            let isCompleted = index >= permissions.count || !isGranted
            if isCompleted { handler(isGranted) }
            else {
                requestPermission(permission: permissions[index]) {
                    recursive(index: index + 1, isGranted: $0)
                }
            }
        }
        recursive(index: 0, isGranted: true)
    }
    
    public func requestPermission(permission: Permission, completionHandler handler: @escaping (Bool) -> Void) {
        switch permission {
        case .video:
            AVCaptureDevice.requestAccess(for: .video, completionHandler: handler)
        case .audio:
            AVCaptureDevice.requestAccess(for: .audio, completionHandler: handler)
        case .album:
            if #available(iOS 14.0, *) {
                PHPhotoLibrary.requestAuthorization(for: .readWrite) { handler($0 == .authorized || $0 == .limited) }
            } else {
                PHPhotoLibrary.requestAuthorization() { handler($0 == .authorized) }
            }
        }
    }
    
    public enum Permission: Int {
        case album, audio, video
    }
}
