//
//  CameraSelectorDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/16.
//

import Foundation

class CameraSelectorDelegate: PigeonApiDelegateCameraSelectorProxyApi {
    class BuilderDelegate: PigeonApiDelegateCameraSelectorBuilderProxyApi {
        func pigeonDefaultConstructor(pigeonApi: PigeonApiCameraSelectorBuilderProxyApi) throws -> CameraSelector.Builder {
            return CameraSelector.Builder()
        }
        
        func requireLensFacing(pigeonApi: PigeonApiCameraSelectorBuilderProxyApi, pigeonInstance: CameraSelector.Builder, lensFacing: CameraSelectorLensFacingApi) throws -> CameraSelector.Builder {
            return try pigeonInstance.requireLensFacing(lensFacing.delegate)
        }
        
        func build(pigeonApi: PigeonApiCameraSelectorBuilderProxyApi, pigeonInstance: CameraSelector.Builder) throws -> CameraSelector {
            return pigeonInstance.build()
        }
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
