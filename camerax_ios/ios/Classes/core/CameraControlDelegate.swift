//
//  CameraControlDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/22.
//

import Foundation

class CameraControlDelegate: PigeonApiDelegateCameraControlApi {
    func enableTorch(pigeonApi: PigeonApiCameraControlApi, pigeonInstance: any CameraControl, torch: Bool) throws {
        try pigeonInstance.enableTorch(torch)
    }
    
    func setZoomRatio(pigeonApi: PigeonApiCameraControlApi, pigeonInstance: any CameraControl, ratio: Double) throws {
        try pigeonInstance.setZoomRatio(ratio)
    }
    
    func setLinearZoom(pigeonApi: PigeonApiCameraControlApi, pigeonInstance: any CameraControl, linearZoom: Double) throws {
        try pigeonInstance.setLinearZoom(linearZoom)
    }
    
    func startFocusAndMetering(pigeonApi: PigeonApiCameraControlApi, pigeonInstance: any CameraControl, action: FocusMeteringAction) throws -> FocusMeteringResult {
        let result = try pigeonInstance.startFocusAndMetering(action)
        return result
    }
    
    func cancelFocusAndMetering(pigeonApi: PigeonApiCameraControlApi, pigeonInstance: any CameraControl) throws {
        try pigeonInstance.cancelFocusAndMeteriing()
    }
    
    func setExposureCompensationIndex(pigeonApi: PigeonApiCameraControlApi, pigeonInstance: any CameraControl, value: Int64) throws -> Int64 {
        let newValue = try pigeonInstance.setExposureCompensationIndex(Int(value))
        return Int64(newValue)
    }
}
