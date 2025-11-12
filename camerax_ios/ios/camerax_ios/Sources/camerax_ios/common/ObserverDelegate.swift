//
//  ObserverDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/15.
//

import Foundation

class CameraStateObserverDelegate: PigeonApiDelegateCameraStateObserverProxyApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiCameraStateObserverProxyApi) throws -> CameraStateObserver {
        return CameraStateObserver(pigeonApi)
    }
}

class TorchStateObserverDelegate: PigeonApiDelegateTorchStateObserverProxyApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiTorchStateObserverProxyApi) throws -> TorchStateObserver {
        return TorchStateObserver(pigeonApi)
    }
}

class ZoomStateObserverDelegate: PigeonApiDelegateZoomStateObserverProxyApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiZoomStateObserverProxyApi) throws -> ZoomStateObserver {
        return ZoomStateObserver(pigeonApi)
    }
}

class CameraStateObserver: NSObject, Observer {
    private let api: PigeonApiCameraStateObserverProxyApi
    
    init(_ api: PigeonApiCameraStateObserverProxyApi) {
        self.api = api
    }
    
    func onChanged(_ value: CameraState) {
        api.onChanged(pigeonInstance: self, value: value.api) { _ in }
    }
}

class TorchStateObserver: NSObject, Observer {
    private let api: PigeonApiTorchStateObserverProxyApi
    
    init(_ api: PigeonApiTorchStateObserverProxyApi) {
        self.api = api
    }
    
    func onChanged(_ value: TorchState) {
        api.onChanged(pigeonInstance: self, value: value.api) { _ in }
    }
}

class ZoomStateObserver: NSObject, Observer {
    private let api: PigeonApiZoomStateObserverProxyApi
    
    init(_ api: PigeonApiZoomStateObserverProxyApi) {
        self.api = api
    }
    
    func onChanged(_ value: ZoomState) {
        api.onChanged(pigeonInstance: self, value: value) { _ in }
    }
}
