//
//  ObserverDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/15.
//

import Foundation

class CameraStateObserverDelegate: PigeonApiDelegateCameraStateObserverApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiCameraStateObserverApi) throws -> CameraStateObserver {
        return CameraStateObserver(pigeonApi)
    }
}

class TorchStateObserverDelegate: PigeonApiDelegateTorchStateObserverApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiTorchStateObserverApi) throws -> TorchStateObserver {
        return TorchStateObserver(pigeonApi)
    }
}

class ZoomStateObserverDelegate: PigeonApiDelegateZoomStateObserverApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiZoomStateObserverApi) throws -> ZoomStateObserver {
        return ZoomStateObserver(pigeonApi)
    }
}

class CameraStateObserver: NSObject, Observer {
    private let api: PigeonApiCameraStateObserverApi
    
    init(_ api: PigeonApiCameraStateObserverApi) {
        self.api = api
    }
    
    func onChanged(_ value: CameraState) {
        api.onChanged(pigeonInstance: self, value: value.api) { _ in }
    }
}

class TorchStateObserver: NSObject, Observer {
    private let api: PigeonApiTorchStateObserverApi
    
    init(_ api: PigeonApiTorchStateObserverApi) {
        self.api = api
    }
    
    func onChanged(_ value: TorchState) {
        api.onChanged(pigeonInstance: self, value: value.api) { _ in }
    }
}

class ZoomStateObserver: NSObject, Observer {
    private let api: PigeonApiZoomStateObserverApi
    
    init(_ api: PigeonApiZoomStateObserverApi) {
        self.api = api
    }
    
    func onChanged(_ value: ZoomState) {
        api.onChanged(pigeonInstance: self, value: value) { _ in }
    }
}
