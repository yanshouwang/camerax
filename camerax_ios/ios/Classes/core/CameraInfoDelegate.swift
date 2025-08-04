//
//  CameraInfoDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/22.
//

import Foundation

class CameraInfoDelegate: PigeonApiDelegateCameraInfoApi {
    func mustPlayShutterSound(pigeonApi: PigeonApiCameraInfoApi) throws -> Bool {
        throw CameraXError(code: "unimplemented-error", message: "mustPlayShutterSound is not implemented", details: nil)
    }
    
    func getCameraSelector(pigeonApi: PigeonApiCameraInfoApi, pigeonInstance: CameraInfo) throws -> CameraSelector {
        return pigeonInstance.getCameraSelector()
    }
    
    func getCameraState(pigeonApi: PigeonApiCameraInfoApi, pigeonInstance: CameraInfo) throws -> CameraStateLiveData {
        throw CameraXError(code: "unimplemented-error", message: "getCameraState is not implemented", details: nil)
    }
    
    func getTorchState(pigeonApi: PigeonApiCameraInfoApi, pigeonInstance: CameraInfo) throws -> TorchStateLiveData {
        let instance = pigeonInstance.getTorchState()
        return TorchStateLiveData(instance)
    }
    
    func getZoomState(pigeonApi: PigeonApiCameraInfoApi, pigeonInstance: CameraInfo) throws -> ZoomStateLiveData {
        let instance = pigeonInstance.getZoomState()
        return ZoomStateLiveData(instance)
    }
    
    func getIntrinsticZoomRatio(pigeonApi: PigeonApiCameraInfoApi, pigeonInstance: CameraInfo) throws -> Double {
        throw CameraXError(code: "unimplemented-error", message: "getCameraState is not implemented", details: nil)
    }
    
    func getLensFacing(pigeonApi: PigeonApiCameraInfoApi, pigeonInstance: CameraInfo) throws -> LensFacingApi {
        return pigeonInstance.getLensFacing().api
    }
    
    func getPhysicalCameraInfos(pigeonApi: PigeonApiCameraInfoApi, pigeonInstance: CameraInfo) throws -> [CameraInfo] {
        throw CameraXError(code: "unimplemented-error", message: "getCameraState is not implemented", details: nil)
    }
    
    func getSensorRotationDegrees(pigeonApi: PigeonApiCameraInfoApi, pigeonInstance: CameraInfo) throws -> Int64 {
        throw CameraXError(code: "unimplemented-error", message: "getCameraState is not implemented", details: nil)
    }
    
    func isLogicalMultiCameraSupported(pigeonApi: PigeonApiCameraInfoApi, pigeonInstance: CameraInfo) throws -> Bool {
        throw CameraXError(code: "unimplemented-error", message: "getCameraState is not implemented", details: nil)
    }
    
    func isZslSupported(pigeonApi: PigeonApiCameraInfoApi, pigeonInstance: CameraInfo) throws -> Bool {
        throw CameraXError(code: "unimplemented-error", message: "getCameraState is not implemented", details: nil)
    }
    
    func hasFlashUnit(pigeonApi: PigeonApiCameraInfoApi, pigeonInstance: CameraInfo) throws -> Bool {
        throw CameraXError(code: "unimplemented-error", message: "getCameraState is not implemented", details: nil)
    }
    
    func isFocusMeteringSupported(pigeonApi: PigeonApiCameraInfoApi, pigeonInstance: CameraInfo, action: FocusMeteringAction) throws -> Bool {
        throw CameraXError(code: "unimplemented-error", message: "getCameraState is not implemented", details: nil)
    }
}
