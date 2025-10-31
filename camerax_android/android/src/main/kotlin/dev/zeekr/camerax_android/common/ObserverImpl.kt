package dev.zeekr.camerax_android.common

import androidx.camera.core.CameraState
import androidx.camera.core.ZoomState
import androidx.lifecycle.Observer
import dev.zeekr.camerax_android.CameraXRegistrarImpl
import dev.zeekr.camerax_android.PigeonApiCameraStateObserverApi
import dev.zeekr.camerax_android.PigeonApiTorchStateObserverApi
import dev.zeekr.camerax_android.PigeonApiZoomStateObserverApi
import dev.zeekr.camerax_android.core.api
import dev.zeekr.camerax_android.core.torchStateApi


class CameraStateObserverImpl(impl: CameraXRegistrarImpl) : PigeonApiCameraStateObserverApi(impl) {
    override fun pigeon_defaultConstructor(): CameraStateObserver {
        return CameraStateObserver(this)
    }
}

class TorchStateObserverImpl(impl: CameraXRegistrarImpl) : PigeonApiTorchStateObserverApi(impl) {
    override fun pigeon_defaultConstructor(): TorchStateObserver {
        return TorchStateObserver(this)
    }
}

class ZoomStateObserverImpl(impl: CameraXRegistrarImpl) : PigeonApiZoomStateObserverApi(impl) {
    override fun pigeon_defaultConstructor(): ZoomStateObserver {
        return ZoomStateObserver(this)
    }
}

class CameraStateObserver(private val impl: CameraStateObserverImpl) : Observer<CameraState> {
    override fun onChanged(value: CameraState) {
        impl.onChanged(this, value.api) {}
    }
}

class TorchStateObserver(private val impl: TorchStateObserverImpl) : Observer<Int> {
    override fun onChanged(value: Int) {
        impl.onChanged(this, value.torchStateApi) {}
    }
}

class ZoomStateObserver(private val impl: ZoomStateObserverImpl) : Observer<ZoomState> {
    override fun onChanged(value: ZoomState) {
        impl.onChanged(this, value) {}
    }
}