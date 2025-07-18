//
//  CameraInfo.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/22.
//

import Foundation

public protocol CameraInfo: NSObjectProtocol {
    func getCameraSelector() -> CameraSelector
    func getTorchState() -> LiveData<TorchState>
    func getZoomState() -> LiveData<ZoomState>
}

public extension CameraInfo {
    func getLensFacing() -> LensFacing {
        let cameraSelector = getCameraSelector()
        return cameraSelector.lensFacing
    }
}
