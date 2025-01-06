package dev.hebei.camerax_android.legacy.core

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiZoomStateObserver

class ZoomStateObserver(registrar: CameraXRegistrar) : PigeonApiZoomStateObserver(registrar) {
    override fun pigeon_defaultConstructor(): Wrapper {
        return Wrapper(this)
    }

    class Wrapper(private val instance: ZoomStateObserver) {
        internal val obj =
            androidx.lifecycle.Observer<dev.hebei.camerax_android.core.ZoomState> { value ->
                instance.onChanged(this, value) {}
            }
    }
}