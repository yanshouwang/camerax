package dev.hebei.camerax_android.legacy.common

import dev.hebei.camerax_android.legacy.CameraState
import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiCameraStateLiveData
import dev.hebei.camerax_android.legacy.PigeonApiTorchStateLiveData
import dev.hebei.camerax_android.legacy.PigeonApiZoomStateLiveData
import dev.hebei.camerax_android.legacy.TorchState

class CameraStateLiveData(private val registrar: CameraXRegistrar) : PigeonApiCameraStateLiveData(registrar) {
    override fun getValue(pigeon_instance: Stub): CameraState? {
        return pigeon_instance.value
    }

    override fun observe(pigeon_instance: Stub, observer: CameraStateObserver.Impl) {
        val owner = registrar.activity as androidx.lifecycle.LifecycleOwner
        pigeon_instance.observe(owner, observer)
    }

    override fun removeObserver(pigeon_instance: Stub, observer: CameraStateObserver.Impl) {
        pigeon_instance.removeObserver(observer)
    }

    class Stub(internal val obj: androidx.lifecycle.LiveData<CameraState>) {
        val value get() = obj.value

        fun observe(owner: androidx.lifecycle.LifecycleOwner, observer: CameraStateObserver.Impl) {
            obj.observe(owner, observer.obj)
        }

        fun removeObserver(observer: CameraStateObserver.Impl) {
            obj.removeObserver(observer.obj)
        }
    }
}

class TorchStateLiveData(private val registrar: CameraXRegistrar) : PigeonApiTorchStateLiveData(registrar) {
    override fun getValue(pigeon_instance: Stub): TorchState? {
        return pigeon_instance.value
    }

    override fun observe(pigeon_instance: Stub, observer: TorchStateObserver.Impl) {
        val owner = registrar.activity as androidx.lifecycle.LifecycleOwner
        return pigeon_instance.observe(owner, observer)
    }

    override fun removeObserver(pigeon_instance: Stub, observer: TorchStateObserver.Impl) {
        pigeon_instance.removeObserver(observer)
    }

    class Stub(internal val obj: androidx.lifecycle.LiveData<TorchState>) {
        val value get() = obj.value

        fun observe(owner: androidx.lifecycle.LifecycleOwner, observer: TorchStateObserver.Impl) {
            obj.observe(owner, observer.obj)
        }

        fun removeObserver(observer: TorchStateObserver.Impl) {
            obj.removeObserver(observer.obj)
        }
    }
}

class ZoomStateLiveData(private val registrar: CameraXRegistrar) : PigeonApiZoomStateLiveData(registrar) {
    override fun getValue(pigeon_instance: Stub): androidx.camera.core.ZoomState? {
        return pigeon_instance.value
    }

    override fun observe(pigeon_instance: Stub, observer: ZoomStateObserver.Impl) {
        val owner = registrar.activity as androidx.lifecycle.LifecycleOwner
        pigeon_instance.observe(owner, observer)
    }

    override fun removeObserver(pigeon_instance: Stub, observer: ZoomStateObserver.Impl) {
        pigeon_instance.removeObserver(observer)
    }

    class Stub(internal val obj: androidx.lifecycle.LiveData<androidx.camera.core.ZoomState>) {
        val value get() = obj.value

        fun observe(owner: androidx.lifecycle.LifecycleOwner, observer: ZoomStateObserver.Impl) {
            obj.observe(owner, observer.obj)
        }

        fun removeObserver(observer: ZoomStateObserver.Impl) {
            obj.removeObserver(observer.obj)
        }
    }
}