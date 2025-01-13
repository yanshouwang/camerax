package dev.hebei.camerax_android.legacy.common

import dev.hebei.camerax_android.legacy.CameraState
import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiCameraStateObserver
import dev.hebei.camerax_android.legacy.PigeonApiTorchStateObserver
import dev.hebei.camerax_android.legacy.PigeonApiZoomStateObserver
import dev.hebei.camerax_android.legacy.TorchState


class CameraStateObserver(registrar: CameraXRegistrar) : PigeonApiCameraStateObserver(registrar) {
    override fun pigeon_defaultConstructor(): Impl {
        return Impl(this)
    }

    class Impl(private val api: CameraStateObserver) {
        val obj = androidx.lifecycle.Observer<CameraState> { value ->
            api.onChanged(this, value) {}
        }
    }
}

class TorchStateObserver(registrar: CameraXRegistrar) : PigeonApiTorchStateObserver(registrar) {
    override fun pigeon_defaultConstructor(): Impl {
        return Impl(this)
    }

    class Impl(private val api: TorchStateObserver) {
        val obj = androidx.lifecycle.Observer<TorchState> { value ->
            api.onChanged(this, value) {}
        }
    }
}

class ZoomStateObserver(registrar: CameraXRegistrar) : PigeonApiZoomStateObserver(registrar) {
    override fun pigeon_defaultConstructor(): Impl {
        return Impl(this)
    }

    class Impl(private val api: ZoomStateObserver) {
        internal val obj = androidx.lifecycle.Observer<androidx.camera.core.ZoomState> { value ->
            api.onChanged(this, value) {}
        }
    }
}