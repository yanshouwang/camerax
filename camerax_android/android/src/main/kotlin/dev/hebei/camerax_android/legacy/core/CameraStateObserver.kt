package dev.hebei.camerax_android.legacy.core

import dev.hebei.camerax_android.legacy.CameraState
import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiCameraStateObserver

class CameraStateObserver(registrar: CameraXRegistrar) : PigeonApiCameraStateObserver(registrar) {
    override fun pigeon_defaultConstructor(): Wrapper {
        return Wrapper(this)
    }

    class Wrapper(private val instance: CameraStateObserver) {
        val obj = androidx.lifecycle.Observer<CameraState> { value ->
            instance.onChanged(this, value) {}
        }
    }
}