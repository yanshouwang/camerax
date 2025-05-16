package dev.hebei.camerax_android.common

import dev.hebei.camerax_android.CameraStateApi
import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.PigeonApiCameraStateLiveDataApi
import dev.hebei.camerax_android.PigeonApiTorchStateLiveDataApi
import dev.hebei.camerax_android.PigeonApiZoomStateLiveDataApi
import dev.hebei.camerax_android.TorchStateApi

class CameraStateLiveDataImpl(private val impl: CameraXImpl) : PigeonApiCameraStateLiveDataApi(impl) {
    override fun getValue(pigeon_instance: CameraStateLiveData): CameraStateApi? {
        return pigeon_instance.value
    }

    override fun observe(pigeon_instance: CameraStateLiveData, observer: CameraStateObserver) {
        val owner = impl.activity as androidx.lifecycle.LifecycleOwner
        pigeon_instance.observe(owner, observer)
    }

    override fun removeObserver(pigeon_instance: CameraStateLiveData, observer: CameraStateObserver) {
        pigeon_instance.removeObserver(observer)
    }
}

class TorchStateLiveDataImpl(private val impl: CameraXImpl) : PigeonApiTorchStateLiveDataApi(impl) {
    override fun getValue(pigeon_instance: TorchStateLiveData): TorchStateApi? {
        return pigeon_instance.value
    }

    override fun observe(pigeon_instance: TorchStateLiveData, observer: TorchStateObserver) {
        val owner = impl.activity as androidx.lifecycle.LifecycleOwner
        return pigeon_instance.observe(owner, observer)
    }

    override fun removeObserver(pigeon_instance: TorchStateLiveData, observer: TorchStateObserver) {
        pigeon_instance.removeObserver(observer)
    }
}

class ZoomStateLiveDataImpl(private val impl: CameraXImpl) : PigeonApiZoomStateLiveDataApi(impl) {
    override fun getValue(pigeon_instance: ZoomStateLiveData): androidx.camera.core.ZoomState? {
        return pigeon_instance.value
    }

    override fun observe(pigeon_instance: ZoomStateLiveData, observer: ZoomStateObserver) {
        val owner = impl.activity as androidx.lifecycle.LifecycleOwner
        pigeon_instance.observe(owner, observer)
    }

    override fun removeObserver(pigeon_instance: ZoomStateLiveData, observer: ZoomStateObserver) {
        pigeon_instance.removeObserver(observer)
    }
}

class CameraStateLiveData(internal val obj: androidx.lifecycle.LiveData<CameraStateApi>) {
    val value get() = obj.value

    fun observe(owner: androidx.lifecycle.LifecycleOwner, observer: CameraStateObserver) {
        obj.observe(owner, observer.obj)
    }

    fun removeObserver(observer: CameraStateObserver) {
        obj.removeObserver(observer.obj)
    }
}

class TorchStateLiveData(internal val obj: androidx.lifecycle.LiveData<TorchStateApi>) {
    val value get() = obj.value

    fun observe(owner: androidx.lifecycle.LifecycleOwner, observer: TorchStateObserver) {
        obj.observe(owner, observer.obj)
    }

    fun removeObserver(observer: TorchStateObserver) {
        obj.removeObserver(observer.obj)
    }
}

class ZoomStateLiveData(internal val obj: androidx.lifecycle.LiveData<androidx.camera.core.ZoomState>) {
    val value get() = obj.value

    fun observe(owner: androidx.lifecycle.LifecycleOwner, observer: ZoomStateObserver) {
        obj.observe(owner, observer.obj)
    }

    fun removeObserver(observer: ZoomStateObserver) {
        obj.removeObserver(observer.obj)
    }
}