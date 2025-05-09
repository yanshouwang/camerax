package dev.hebei.camerax_android.common

import dev.hebei.camerax_android.CameraStateApi
import dev.hebei.camerax_android.CameraXRegistrar
import dev.hebei.camerax_android.PigeonApiCameraStateObserverApi
import dev.hebei.camerax_android.PigeonApiTorchStateObserverApi
import dev.hebei.camerax_android.PigeonApiZoomStateObserverApi
import dev.hebei.camerax_android.TorchStateApi


class CameraStateObserverImpl(registrar: CameraXRegistrar) : PigeonApiCameraStateObserverApi(registrar) {
    override fun pigeon_defaultConstructor(): CameraStateObserver {
        return CameraStateObserver(this)
    }
}

class TorchStateObserverImpl(registrar: CameraXRegistrar) : PigeonApiTorchStateObserverApi(registrar) {
    override fun pigeon_defaultConstructor(): TorchStateObserver {
        return TorchStateObserver(this)
    }
}

class ZoomStateObserverImpl(registrar: CameraXRegistrar) : PigeonApiZoomStateObserverApi(registrar) {
    override fun pigeon_defaultConstructor(): ZoomStateObserver {
        return ZoomStateObserver(this)
    }
}

class CameraStateObserver(private val api: PigeonApiCameraStateObserverApi) {
    val obj = androidx.lifecycle.Observer<CameraStateApi> { value ->
        api.onChanged(this, value) {}
    }
}

class TorchStateObserver(private val api: PigeonApiTorchStateObserverApi) {
    val obj = androidx.lifecycle.Observer<TorchStateApi> { value ->
        api.onChanged(this, value) {}
    }
}

class ZoomStateObserver(private val api: PigeonApiZoomStateObserverApi) {
    internal val obj = androidx.lifecycle.Observer<androidx.camera.core.ZoomState> { value ->
        api.onChanged(this, value) {}
    }
}