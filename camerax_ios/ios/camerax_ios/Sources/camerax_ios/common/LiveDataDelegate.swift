//
//  LiveDataDelegate.swift
//  Pods
//
//  Created by 闫守旺 on 2026/1/6.
//

class CameraStateLiveDataDelegate: PigeonApiDelegateCameraStateLiveDataProxyApi {
    func getValue(pigeonApi: PigeonApiCameraStateLiveDataProxyApi, pigeonInstance: CameraStateLiveData) throws -> CameraStateApi? {
        return pigeonInstance.instance.getValue()?.api
    }
    
    func observeForever(pigeonApi: PigeonApiCameraStateLiveDataProxyApi, pigeonInstance: CameraStateLiveData, observer: CameraStateObserver) throws {
        pigeonInstance.instance.observeForever(observer)
    }
    
    func removeObserver(pigeonApi: PigeonApiCameraStateLiveDataProxyApi, pigeonInstance: CameraStateLiveData, observer: CameraStateObserver) throws {
        pigeonInstance.instance.removeObserver(observer)
    }
}

class TorchStateLiveDataDelegate: PigeonApiDelegateTorchStateLiveDataProxyApi {
    func getValue(pigeonApi: PigeonApiTorchStateLiveDataProxyApi, pigeonInstance: TorchStateLiveData) throws -> TorchStateApi? {
        return pigeonInstance.instance.getValue()?.api
    }
    
    func observeForever(pigeonApi: PigeonApiTorchStateLiveDataProxyApi, pigeonInstance: TorchStateLiveData, observer: TorchStateObserver) throws {
        pigeonInstance.instance.observeForever(observer)
    }
    
    func removeObserver(pigeonApi: PigeonApiTorchStateLiveDataProxyApi, pigeonInstance: TorchStateLiveData, observer: TorchStateObserver) throws {
        pigeonInstance.instance.removeObserver(observer)
    }
}

class ZoomStateLiveDataDelegate: PigeonApiDelegateZoomStateLiveDataProxyApi {
    func getValue(pigeonApi: PigeonApiZoomStateLiveDataProxyApi, pigeonInstance: ZoomStateLiveData) throws -> ZoomState? {
        return pigeonInstance.instance.getValue()
    }
    
    func observeForever(pigeonApi: PigeonApiZoomStateLiveDataProxyApi, pigeonInstance: ZoomStateLiveData, observer: ZoomStateObserver) throws {
        pigeonInstance.instance.observeForever(observer)
    }
    
    func removeObserver(pigeonApi: PigeonApiZoomStateLiveDataProxyApi, pigeonInstance: ZoomStateLiveData, observer: ZoomStateObserver) throws {
        pigeonInstance.instance.removeObserver(observer)
    }
}

class CameraStateLiveData: NSObject {
    public let instance: LiveData<CameraState>
    
    init(instance: LiveData<CameraState>) {
        self.instance = instance
    }
}

class TorchStateLiveData: NSObject {
    public let instance: LiveData<TorchState>
    
    init(_ instance: LiveData<TorchState>) {
        self.instance = instance
    }
}

class ZoomStateLiveData: NSObject {
    public let instance: LiveData<ZoomState>
    
    init(_ instance: LiveData<ZoomState>) {
        self.instance = instance
    }
}
