//
//  CameraSelectorDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/16.
//

import Foundation

class CameraSelectorDelegate: PigeonApiDelegateCameraSelectorProxyApi {
    func build(pigeonApi: PigeonApiCameraSelectorProxyApi, lensFacing: CameraSelectorLensFacingApi?) throws -> CameraSelector {
        return CameraSelector(lensFacing: lensFacing?.delegate)
    }
    
    func front(pigeonApi: PigeonApiCameraSelectorProxyApi) throws -> CameraSelector {
        return CameraSelector.front
    }
    
    func back(pigeonApi: PigeonApiCameraSelectorProxyApi) throws -> CameraSelector {
        return CameraSelector.back
    }
    
    func external(pigeonApi: PigeonApiCameraSelectorProxyApi) throws -> CameraSelector {
        return CameraSelector.external
    }
}

extension CameraSelectorLensFacingApi {
    var delegate: CameraSelector.LensFacing {
        return switch self {
        case .unknown: .unknown
        case .front: .front
        case .back: .back
        case .external: .external
        }
    }
}

extension CameraSelector.LensFacing {
    var api: CameraSelectorLensFacingApi {
        return switch self {
        case .unknown: .unknown
        case .front: .front
        case .back: .back
        case .external: .external
        }
    }
}
