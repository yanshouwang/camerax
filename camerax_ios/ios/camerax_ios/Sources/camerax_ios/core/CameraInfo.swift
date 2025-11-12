//
//  CameraInfo.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/22.
//

import Foundation
import AVFoundation

public class CameraInfo: NSObject {
    private var cameraSelector: CameraSelector
    private let torchControl: TorchControl
    private let zoomControl: ZoomControl
    
    init(cameraSelector: CameraSelector, torchControl: TorchControl, zoomControl: ZoomControl) {
        self.cameraSelector = cameraSelector
        self.torchControl = torchControl
        self.zoomControl = zoomControl
    }
    
    public func getCameraSelector() -> CameraSelector {
        return self.cameraSelector
    }
    
    func setCameraSelector(_ cameraSelector: CameraSelector) {
        self.cameraSelector = cameraSelector
    }
    
    public func getTorchState() -> LiveData<TorchState> {
        return self.torchControl.getTorchState()
    }
    
    public func getZoomState() -> LiveData<ZoomState> {
        return self.zoomControl.getZoomState()
    }
}

public extension CameraInfo {
    func getLensFacing() -> CameraSelector.LensFacing {
        let cameraSelector = getCameraSelector()
        return cameraSelector.lensFacing
    }
}
