//
//  CameraControlDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/22.
//

import Foundation

class CameraControlDelegate: PigeonApiDelegateCameraControlApi {
    func enableTorch(pigeonApi: PigeonApiCameraControlApi, pigeonInstance: CameraControl, torch: Bool) throws {
        try pigeonInstance.enableTorch(torch)
    }
    
    func setZoomRatio(pigeonApi: PigeonApiCameraControlApi, pigeonInstance: CameraControl, ratio: Double) throws {
        try pigeonInstance.setZoomRatio(ratio)
    }
    
    func setLinearZoom(pigeonApi: PigeonApiCameraControlApi, pigeonInstance: CameraControl, linearZoom: Double) throws {
        try pigeonInstance.setLinearZoom(linearZoom)
    }
    
    func startFocusAndMetering(pigeonApi: PigeonApiCameraControlApi, pigeonInstance: CameraControl, action: FocusMeteringAction) throws -> FocusMeteringResult {
        let result = try pigeonInstance.startFocusAndMetering(action)
        return result
    }
    
    func cancelFocusAndMetering(pigeonApi: PigeonApiCameraControlApi, pigeonInstance: CameraControl) throws {
        try pigeonInstance.cancelFocusAndMeteriing()
    }
    
    func setExposureCompensationIndex(pigeonApi: PigeonApiCameraControlApi, pigeonInstance: CameraControl, value: Int64) throws -> Int64 {
        throw CameraXError(code: "unimplemented-error", message: "setExposureCompensationIndex is not implemented", details: nil)
    }
}
