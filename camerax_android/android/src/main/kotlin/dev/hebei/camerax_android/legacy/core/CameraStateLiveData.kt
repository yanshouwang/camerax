package dev.hebei.camerax_android.legacy.core

import dev.hebei.camerax_android.legacy.CameraState
import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiCameraStateLiveData

class CameraStateLiveData(private val registrar: CameraXRegistrar) :
    PigeonApiCameraStateLiveData(registrar) {
    override fun getValue(pigeon_instance: Wrapper): CameraState? {
        return pigeon_instance.value
    }

    override fun observe(pigeon_instance: Wrapper, observer: CameraStateObserver.Wrapper) {
        val owner = registrar.activity as androidx.lifecycle.LifecycleOwner
        pigeon_instance.observe(owner, observer)
    }

    override fun removeObserver(pigeon_instance: Wrapper, observer: CameraStateObserver.Wrapper) {
        pigeon_instance.removeObserver(observer)
    }

    class Wrapper(internal val obj: androidx.lifecycle.LiveData<CameraState>) {
        val value get() = obj.value

        fun observe(
            owner: androidx.lifecycle.LifecycleOwner, observer: CameraStateObserver.Wrapper
        ) {
            obj.observe(owner, observer.obj)
        }

        fun removeObserver(observer: CameraStateObserver.Wrapper) {
            obj.removeObserver(observer.obj)
        }
    }
}