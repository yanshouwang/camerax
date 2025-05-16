//
//  ObserverImpl.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/15.
//

import Foundation

class TorchStateObserverImpl: PigeonApiDelegateTorchStateObserverApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiTorchStateObserverApi) throws -> TorchStateObserver {
        return TorchStateObserver(pigeonApi)
    }
}

class ZoomStateObserverImpl: PigeonApiDelegateZoomStateObserverApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiZoomStateObserverApi) throws -> ZoomStateObserver {
        return ZoomStateObserver(pigeonApi)
    }
}

class TorchStateObserver: Observer<TorchState> {
    typealias T = TorchState
    
    let api: PigeonApiTorchStateObserverApi
    
    init(_ api: PigeonApiTorchStateObserverApi) {
        self.api = api
    }
    
    func onChanged(_ value: TorchState) {
        api.onChanged(pigeonInstance: self, value: value.api) { _ in }
    }
}

class ZoomStateObserver: Observer<ZoomState> {
    typealias T = ZoomState
    
    let api: PigeonApiZoomStateObserverApi
    
    init(_ api: PigeonApiZoomStateObserverApi) {
        self.api = api
    }
    
    func onChanged(_ value: ZoomState) {
        api.onChanged(pigeonInstance: self, value: value) { _ in }
    }
}
