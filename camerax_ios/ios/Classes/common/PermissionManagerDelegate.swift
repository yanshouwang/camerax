//
//  PermissionManagerDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/14.
//

import Foundation

class PermissionManagerDelegate: PigeonApiDelegatePermissionManagerApi {
    func instance(pigeonApi: PigeonApiPermissionManagerApi) throws -> PermissionManager {
        return PermissionManager.shared
    }
    
    func checkPermissioin(pigeonApi: PigeonApiPermissionManagerApi, pigeonInstance: PermissionManager, permission: PermissionApi) throws -> Bool {
        return pigeonInstance.checkPermission(permission: permission.delegate)
    }
    
    func requestPermissions(pigeonApi: PigeonApiPermissionManagerApi, pigeonInstance: PermissionManager, permissions: [PermissionApi], completion: @escaping (Result<Bool, any Error>) -> Void) {
        pigeonInstance.requestPermissions(permissions: permissions.map { $0.delegate }) {
            completion(.success($0))
        }
    }
}

extension PermissionApi {
    var delegate: PermissionManager.Permission {
        switch self {
        case .album:
            return .album
        case .audio:
            return .audio
        case .video:
            return .video
        }
    }
}
