//
//  LiveDataDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/18.
//

import Foundation

class CameraStateLiveDataDelegate: PigeonApiDelegateCameraStateLiveDataApi {
    func getValue(pigeonApi: PigeonApiCameraStateLiveDataApi, pigeonInstance: CameraStateLiveData) throws -> CameraStateApi? {
        return pigeonInstance.instance.getValue()?.api
    }
    
    func observe(pigeonApi: PigeonApiCameraStateLiveDataApi, pigeonInstance: CameraStateLiveData, observer: CameraStateObserver) throws {
        pigeonInstance.instance.observe(observer)
    }
    
    func removeObserver(pigeonApi: PigeonApiCameraStateLiveDataApi, pigeonInstance: CameraStateLiveData, observer: CameraStateObserver) throws {
        pigeonInstance.instance.removeObserver(observer)
    }
    
}

class TorchStateLiveDataDelegate: PigeonApiDelegateTorchStateLiveDataApi {
    func getValue(pigeonApi: PigeonApiTorchStateLiveDataApi, pigeonInstance: TorchStateLiveData) throws -> TorchStateApi? {
        return pigeonInstance.instance.getValue()?.api
    }
    
    func observe(pigeonApi: PigeonApiTorchStateLiveDataApi, pigeonInstance: TorchStateLiveData, observer: TorchStateObserver) throws {
        pigeonInstance.instance.observe(observer)
    }
    
    func removeObserver(pigeonApi: PigeonApiTorchStateLiveDataApi, pigeonInstance: TorchStateLiveData, observer: TorchStateObserver) throws {
        pigeonInstance.instance.removeObserver(observer)
    }
    
}

class ZoomStateLiveDataDelegate: PigeonApiDelegateZoomStateLiveDataApi {
    func getValue(pigeonApi: PigeonApiZoomStateLiveDataApi, pigeonInstance: ZoomStateLiveData) throws -> ZoomState? {
        return pigeonInstance.instance.getValue()
    }
    
    func observe(pigeonApi: PigeonApiZoomStateLiveDataApi, pigeonInstance: ZoomStateLiveData, observer: ZoomStateObserver) throws {
        pigeonInstance.instance.observe(observer)
    }
    
    func removeObserver(pigeonApi: PigeonApiZoomStateLiveDataApi, pigeonInstance: ZoomStateLiveData, observer: ZoomStateObserver) throws {
        pigeonInstance.instance.removeObserver(observer)
    }
    
}

class CameraStateLiveData: NSObject {
    let instance: LiveData<CameraState>
    
    init(_ instance: LiveData<CameraState>) {
        self.instance = instance
    }
}

class TorchStateLiveData: NSObject {
    let instance: LiveData<TorchState>
    
    init(_ instance: LiveData<TorchState>) {
        self.instance = instance
    }
}

class ZoomStateLiveData: NSObject {
    let instance: LiveData<ZoomState>
    
    init(_ instance: LiveData<ZoomState>) {
        self.instance = instance
    }
}
