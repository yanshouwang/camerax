//
//  CameraInfo.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/22.
//

import Foundation

public protocol CameraInfo: NSObjectProtocol {
    func getCameraSelector() -> CameraSelector
    func getTorchState() -> TorchState?
    func observeTorchState(_ onChanged: @escaping (_ value: TorchState) -> Void) -> NSKeyValueObservation
    func getZoomState() -> ZoomState?
    func observeZoomState(_ onChanged: @escaping (_ value: ZoomState) -> Void) -> NSKeyValueObservation
}

extension CameraInfo {
    func getLensFacing() -> LensFacing {
        let cameraSelector = getCameraSelector()
        return cameraSelector.lensFacing
    }
}
