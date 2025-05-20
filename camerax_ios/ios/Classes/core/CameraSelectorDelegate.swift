//
//  CameraSelectorDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/16.
//

import Foundation

class CameraSelectorDelegate: PigeonApiDelegateCameraSelectorApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiCameraSelectorApi, lensFacing: LensFacingApi?) throws -> CameraSelector {
        return CameraSelector(lensFacing: lensFacing?.delegate)
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
