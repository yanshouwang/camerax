package dev.hebei.camerax_android.legacy.core

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiTorchStateLiveData

class TorchStateLiveData(private val registrar: CameraXRegistrar) :
    PigeonApiTorchStateLiveData(registrar) {
    override fun getValue(pigeon_instance: Wrapper): Boolean? {
        return pigeon_instance.value
    }

    override fun observe(
        pigeon_instance: Wrapper, observer: TorchStateObserver.Wrapper
    ) {
        val owner = registrar.activity as androidx.lifecycle.LifecycleOwner
        return pigeon_instance.observe(owner, observer)
    }

    override fun removeObserver(
        pigeon_instance: Wrapper, observer: TorchStateObserver.Wrapper
    ) {
        pigeon_instance.removeObserver(observer)
    }

    class Wrapper(internal val obj: androidx.lifecycle.LiveData<Boolean>) {
        val value get() = obj.value

        fun observe(
            owner: androidx.lifecycle.LifecycleOwner, observer: TorchStateObserver.Wrapper
        ) {
            obj.observe(owner, observer.obj)
        }

        fun removeObserver(observer: TorchStateObserver.Wrapper) {
            obj.removeObserver(observer.obj)
        }
    }
}