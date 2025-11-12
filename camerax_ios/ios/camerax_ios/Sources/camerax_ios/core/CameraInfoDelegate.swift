//
//  CameraInfoDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/22.
//

import Foundation

class CameraInfoDelegate: PigeonApiDelegateCameraInfoProxyApi {
    func observeCameraState(pigeonApi: PigeonApiCameraInfoProxyApi, pigeonInstance: CameraInfo, observer: CameraStateObserver) throws {
        throw CameraXError(code: "unimplemented-error", message: "observeCameraState is not implemented", details: nil)
    }
    
    func removeCameraStateObserver(pigeonApi: PigeonApiCameraInfoProxyApi, pigeonInstance: CameraInfo, observer: CameraStateObserver) throws {
        throw CameraXError(code: "unimplemented-error", message: "removeCameraStateObserver is not implemented", details: nil)
    }
    
    func getIntrinsicZoomRatio(pigeonApi: PigeonApiCameraInfoProxyApi, pigeonInstance: CameraInfo) throws -> Double {
        throw CameraXError(code: "unimplemented-error", message: "getIntrinsicZoomRatio is not implemented", details: nil)
    }
    
    func getSensorRotationDegrees1(pigeonApi: PigeonApiCameraInfoProxyApi, pigeonInstance: CameraInfo) throws -> Int64 {
        throw CameraXError(code: "unimplemented-error", message: "getSensorRotationDegrees1 is not implemented", details: nil)
    }
    
    func getSensorRotationDegrees2(pigeonApi: PigeonApiCameraInfoProxyApi, pigeonInstance: CameraInfo, relativeRotation: SurfaceRotationApi) throws -> Int64 {
        throw CameraXError(code: "unimplemented-error", message: "getSensorRotationDegrees2 is not implemented", details: nil)
    }
    
    func observeTorchState(pigeonApi: PigeonApiCameraInfoProxyApi, pigeonInstance: CameraInfo, observer: TorchStateObserver) throws {
        pigeonInstance.getTorchState().observe(observer)
    }
    
    func removeTorchStateObserver(pigeonApi: PigeonApiCameraInfoProxyApi, pigeonInstance: CameraInfo, observer: TorchStateObserver) throws {
        pigeonInstance.getTorchState().removeObserver(observer)
    }
    
    func observeZoomState(pigeonApi: PigeonApiCameraInfoProxyApi, pigeonInstance: CameraInfo, observer: ZoomStateObserver) throws {
        pigeonInstance.getZoomState().observe(observer)
    }
    
    func removeZoomStateObserver(pigeonApi: PigeonApiCameraInfoProxyApi, pigeonInstance: CameraInfo, observer: ZoomStateObserver) throws {
        pigeonInstance.getZoomState().removeObserver(observer)
    }
    
    func isLowLightBoostSupported(pigeonApi: PigeonApiCameraInfoProxyApi, pigeonInstance: CameraInfo) throws -> Bool {
        throw CameraXError(code: "unimplemented-error", message: "isLowLightBoostSupported is not implemented", details: nil)
    }
    
    func isTorchStrengthSupported(pigeonApi: PigeonApiCameraInfoProxyApi, pigeonInstance: CameraInfo) throws -> Bool {
        throw CameraXError(code: "unimplemented-error", message: "isTorchStrengthSupported is not implemented", details: nil)
    }
    
    func mustPlayShutterSound(pigeonApi: PigeonApiCameraInfoProxyApi) throws -> Bool {
        throw CameraXError(code: "unimplemented-error", message: "mustPlayShutterSound is not implemented", details: nil)
    }
    
    func getCameraSelector(pigeonApi: PigeonApiCameraInfoProxyApi, pigeonInstance: CameraInfo) throws -> CameraSelector {
        return pigeonInstance.getCameraSelector()
    }
    
    func getCameraState(pigeonApi: PigeonApiCameraInfoProxyApi, pigeonInstance: CameraInfo) throws -> CameraStateApi? {
        throw CameraXError(code: "unimplemented-error", message: "getCameraState is not implemented", details: nil)
    }
    
    func getTorchState(pigeonApi: PigeonApiCameraInfoProxyApi, pigeonInstance: CameraInfo) throws -> TorchStateApi? {
        return pigeonInstance.getTorchState().getValue()?.api
    }
    
    func getZoomState(pigeonApi: PigeonApiCameraInfoProxyApi, pigeonInstance: CameraInfo) throws -> ZoomState? {
        return pigeonInstance.getZoomState().getValue()
    }
    
    func getIntrinsticZoomRatio(pigeonApi: PigeonApiCameraInfoProxyApi, pigeonInstance: CameraInfo) throws -> Double {
        throw CameraXError(code: "unimplemented-error", message: "getCameraState is not implemented", details: nil)
    }
    
    func getLensFacing(pigeonApi: PigeonApiCameraInfoProxyApi, pigeonInstance: CameraInfo) throws -> CameraSelectorLensFacingApi {
        return pigeonInstance.getLensFacing().api
    }
    
    func getPhysicalCameraInfos(pigeonApi: PigeonApiCameraInfoProxyApi, pigeonInstance: CameraInfo) throws -> [CameraInfo] {
        throw CameraXError(code: "unimplemented-error", message: "getCameraState is not implemented", details: nil)
    }
    
    func getSensorRotationDegrees(pigeonApi: PigeonApiCameraInfoProxyApi, pigeonInstance: CameraInfo) throws -> Int64 {
        throw CameraXError(code: "unimplemented-error", message: "getCameraState is not implemented", details: nil)
    }
    
    func isLogicalMultiCameraSupported(pigeonApi: PigeonApiCameraInfoProxyApi, pigeonInstance: CameraInfo) throws -> Bool {
        throw CameraXError(code: "unimplemented-error", message: "getCameraState is not implemented", details: nil)
    }
    
    func isZslSupported(pigeonApi: PigeonApiCameraInfoProxyApi, pigeonInstance: CameraInfo) throws -> Bool {
        throw CameraXError(code: "unimplemented-error", message: "getCameraState is not implemented", details: nil)
    }
    
    func hasFlashUnit(pigeonApi: PigeonApiCameraInfoProxyApi, pigeonInstance: CameraInfo) throws -> Bool {
        throw CameraXError(code: "unimplemented-error", message: "getCameraState is not implemented", details: nil)
    }
    
    func isFocusMeteringSupported(pigeonApi: PigeonApiCameraInfoProxyApi, pigeonInstance: CameraInfo, action: FocusMeteringAction) throws -> Bool {
        throw CameraXError(code: "unimplemented-error", message: "getCameraState is not implemented", details: nil)
    }
}
