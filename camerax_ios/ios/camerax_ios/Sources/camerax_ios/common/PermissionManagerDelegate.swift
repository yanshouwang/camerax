//
//  PermissionManagerDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/14.
//

import Foundation

class PermissionManagerDelegate: PigeonApiDelegatePermissionManagerProxyApi {
    func instance(pigeonApi: PigeonApiPermissionManagerProxyApi) throws -> PermissionManager {
        return PermissionManager.shared
    }
    
    func checkPermissioin(pigeonApi: PigeonApiPermissionManagerProxyApi, pigeonInstance: PermissionManager, permission: PermissionManagerPermissionApi) throws -> Bool {
        return pigeonInstance.checkPermission(permission.delegate)
    }
    
    func requestPermissions(pigeonApi: PigeonApiPermissionManagerProxyApi, pigeonInstance: PermissionManager, permissions: [PermissionManagerPermissionApi], completion: @escaping (Result<Bool, any Error>) -> Void) {
        pigeonInstance.requestPermissions(permissions.map { $0.delegate }) { completion(.success($0)) }
    }
}

extension PermissionManagerPermissionApi {
    var delegate: PermissionManager.Permission {
        switch self {
        case .video:
            return .video
        case .audio:
            return .audio
        }
    }
}
