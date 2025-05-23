package dev.hebei.camerax_android.common

import androidx.camera.core.CameraState
import androidx.camera.core.ZoomState
import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.PigeonApiCameraStateObserverApi
import dev.hebei.camerax_android.PigeonApiTorchStateObserverApi
import dev.hebei.camerax_android.PigeonApiZoomStateObserverApi
import dev.hebei.camerax_android.core.api
import dev.hebei.camerax_android.core.torchStateApi


class CameraStateObserverImpl(impl: CameraXImpl) : PigeonApiCameraStateObserverApi(impl) {
    override fun pigeon_defaultConstructor(): CameraStateObserver {
        return CameraStateObserver(this)
    }
}

class TorchStateObserverImpl(impl: CameraXImpl) : PigeonApiTorchStateObserverApi(impl) {
    override fun pigeon_defaultConstructor(): TorchStateObserver {
        return TorchStateObserver(this)
    }
}

class ZoomStateObserverImpl(impl: CameraXImpl) : PigeonApiZoomStateObserverApi(impl) {
    override fun pigeon_defaultConstructor(): ZoomStateObserver {
        return ZoomStateObserver(this)
    }
}

class CameraStateObserver(private val impl: CameraStateObserverImpl) {
    val obj = androidx.lifecycle.Observer<CameraState> { value ->
        impl.onChanged(this, value.api) {}
    }
}

class TorchStateObserver(private val impl: TorchStateObserverImpl) {
    val obj = androidx.lifecycle.Observer<Int> { value ->
        impl.onChanged(this, value.torchStateApi) {}
    }
}

class ZoomStateObserver(private val impl: ZoomStateObserverImpl) {
    internal val obj = androidx.lifecycle.Observer<ZoomState> { value ->
        impl.onChanged(this, value) {}
    }
}