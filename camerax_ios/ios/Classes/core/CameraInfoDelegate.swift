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
    
    func getCameraSelector(pigeonApi: PigeonApiCameraInfoApi, pigeonInstance: any CameraInfo) throws -> CameraSelector {
        return pigeonInstance.getCameraSelector()
    }
    
    func getCameraState(pigeonApi: PigeonApiCameraInfoApi, pigeonInstance: any CameraInfo) throws -> CameraStateApi? {
        throw CameraXError(code: "unimplemented-error", message: "getCameraState is not implemented", details: nil)
    }
    
    func observeCameraState(pigeonApi: PigeonApiCameraInfoApi, pigeonInstance: any CameraInfo, observer: CameraStateObserver) throws -> NSKeyValueObservation {
        throw CameraXError(code: "unimplemented-error", message: "observeCameraState is not implemented", details: nil)
    }
    
    func getTorchState(pigeonApi: PigeonApiCameraInfoApi, pigeonInstance: any CameraInfo) throws -> TorchStateApi? {
        return pigeonInstance.getTorchState()?.api
    }
    
    func observeTorchState(pigeonApi: PigeonApiCameraInfoApi, pigeonInstance: any CameraInfo, observer: TorchStateObserver) throws -> NSKeyValueObservation {
        return pigeonInstance.observeTorchState(observer.onChanged)
    }
    
    func getZoomState(pigeonApi: PigeonApiCameraInfoApi, pigeonInstance: any CameraInfo) throws -> ZoomState? {
        return pigeonInstance.getZoomState()
    }
    
    func observeZoomState(pigeonApi: PigeonApiCameraInfoApi, pigeonInstance: any CameraInfo, observer: ZoomStateObserver) throws -> NSKeyValueObservation {
        return pigeonInstance.observeZoomState(observer.onChanged)
    }
    
    func getIntrinsticZoomRatio(pigeonApi: PigeonApiCameraInfoApi, pigeonInstance: any CameraInfo) throws -> Double {
        throw CameraXError(code: "unimplemented-error", message: "getCameraState is not implemented", details: nil)
    }
    
    func getLensFacing(pigeonApi: PigeonApiCameraInfoApi, pigeonInstance: any CameraInfo) throws -> LensFacingApi {
        return pigeonInstance.getLensFacing().api
    }
    
    func getPhysicalCameraInfos(pigeonApi: PigeonApiCameraInfoApi, pigeonInstance: any CameraInfo) throws -> [any CameraInfo] {
        throw CameraXError(code: "unimplemented-error", message: "getCameraState is not implemented", details: nil)
    }
    
    func getSensorRotationDegrees(pigeonApi: PigeonApiCameraInfoApi, pigeonInstance: any CameraInfo) throws -> Int64 {
        throw CameraXError(code: "unimplemented-error", message: "getCameraState is not implemented", details: nil)
    }
    
    func isLogicalMultiCameraSupported(pigeonApi: PigeonApiCameraInfoApi, pigeonInstance: any CameraInfo) throws -> Bool {
        throw CameraXError(code: "unimplemented-error", message: "getCameraState is not implemented", details: nil)
    }
    
    func isZslSupported(pigeonApi: PigeonApiCameraInfoApi, pigeonInstance: any CameraInfo) throws -> Bool {
        throw CameraXError(code: "unimplemented-error", message: "getCameraState is not implemented", details: nil)
    }
    
    func hasFlashUnit(pigeonApi: PigeonApiCameraInfoApi, pigeonInstance: any CameraInfo) throws -> Bool {
        throw CameraXError(code: "unimplemented-error", message: "getCameraState is not implemented", details: nil)
    }
    
    func isFocusMeteringSupported(pigeonApi: PigeonApiCameraInfoApi, pigeonInstance: any CameraInfo, action: FocusMeteringAction) throws -> Bool {
        throw CameraXError(code: "unimplemented-error", message: "getCameraState is not implemented", details: nil)
    }
    
}
