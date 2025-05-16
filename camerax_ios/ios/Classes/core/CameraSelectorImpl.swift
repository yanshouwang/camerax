//
//  CameraSelectorImpl.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/16.
//

import Foundation

class CameraSelectorImpl: PigeonApiDelegateCameraSelectorApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiCameraSelectorApi, lensFacing: LensFacingApi?) throws -> CameraSelector {
        return CameraSelector(lensFacing: lensFacing?.impl)
    }
    
    func front(pigeonApi: PigeonApiCameraSelectorApi) throws -> CameraSelector {
        return CameraSelector.front
    }
    
    func back(pigeonApi: PigeonApiCameraSelectorApi) throws -> CameraSelector {
        return CameraSelector.back
    }
    
    func external(pigeonApi: PigeonApiCameraSelectorApi) throws -> CameraSelector {
        return CameraSelector.external
    }
}
