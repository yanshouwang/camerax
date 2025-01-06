package dev.hebei.camerax_android.legacy.core

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiTorchStateObserver

class TorchStateObserver(registrar: CameraXRegistrar) : PigeonApiTorchStateObserver(registrar) {
    override fun pigeon_defaultConstructor(): Wrapper {
        return Wrapper(this)
    }

    class Wrapper(private val instance: TorchStateObserver) {
        val obj = androidx.lifecycle.Observer<Boolean> { value ->
            instance.onChanged(this, value) {}
        }
    }
}