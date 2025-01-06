package dev.hebei.camerax_android.legacy.core

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiZoomStateLiveData

class ZoomStateLiveData(private val registrar: CameraXRegistrar) :
    PigeonApiZoomStateLiveData(registrar) {
    override fun getValue(pigeon_instance: Wrapper): dev.hebei.camerax_android.core.ZoomState? {
        return pigeon_instance.value
    }

    override fun observe(pigeon_instance: Wrapper, observer: ZoomStateObserver.Wrapper) {
        val owner = registrar.activity as androidx.lifecycle.LifecycleOwner
        pigeon_instance.observe(owner, observer)
    }

    override fun removeObserver(pigeon_instance: Wrapper, observer: ZoomStateObserver.Wrapper) {
        pigeon_instance.removeObserver(observer)
    }

    class Wrapper(internal val obj: androidx.lifecycle.LiveData<dev.hebei.camerax_android.core.ZoomState>) {
        val value get() = obj.value

        fun observe(
            owner: androidx.lifecycle.LifecycleOwner, observer: ZoomStateObserver.Wrapper
        ) {
            obj.observe(owner, observer.obj)
        }

        fun removeObserver(observer: ZoomStateObserver.Wrapper) {
            obj.removeObserver(observer.obj)
        }
    }
}