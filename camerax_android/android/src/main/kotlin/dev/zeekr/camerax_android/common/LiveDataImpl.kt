package dev.zeekr.camerax_android.common

import androidx.camera.core.CameraState
import androidx.camera.core.ZoomState
import androidx.lifecycle.LifecycleOwner
import androidx.lifecycle.LiveData
import dev.zeekr.camerax_android.CameraStateApi
import dev.zeekr.camerax_android.CameraXRegistrarImpl
import dev.zeekr.camerax_android.PigeonApiCameraStateLiveDataApi
import dev.zeekr.camerax_android.PigeonApiTorchStateLiveDataApi
import dev.zeekr.camerax_android.PigeonApiZoomStateLiveDataApi
import dev.zeekr.camerax_android.TorchStateApi
import dev.zeekr.camerax_android.core.api
import dev.zeekr.camerax_android.core.torchStateApi

class CameraStateLiveDataImpl(private val impl: CameraXRegistrarImpl) : PigeonApiCameraStateLiveDataApi(impl) {
    override fun getValue(pigeon_instance: CameraStateLiveData): CameraStateApi? {
        return pigeon_instance.instance.value?.api
    }

    override fun observe(pigeon_instance: CameraStateLiveData, observer: CameraStateObserver) {
        val owner = impl.activity as LifecycleOwner
        pigeon_instance.instance.observe(owner, observer)
    }

    override fun removeObserver(pigeon_instance: CameraStateLiveData, observer: CameraStateObserver) {
        pigeon_instance.instance.removeObserver(observer)
    }
}

class TorchStateLiveDataImpl(private val impl: CameraXRegistrarImpl) : PigeonApiTorchStateLiveDataApi(impl) {
    override fun getValue(pigeon_instance: TorchStateLiveData): TorchStateApi? {
        return pigeon_instance.instance.value?.torchStateApi
    }

    override fun observe(pigeon_instance: TorchStateLiveData, observer: TorchStateObserver) {
        val owner = impl.activity as LifecycleOwner
        return pigeon_instance.instance.observe(owner, observer)
    }

    override fun removeObserver(pigeon_instance: TorchStateLiveData, observer: TorchStateObserver) {
        pigeon_instance.instance.removeObserver(observer)
    }
}

class ZoomStateLiveDataImpl(private val impl: CameraXRegistrarImpl) : PigeonApiZoomStateLiveDataApi(impl) {
    override fun getValue(pigeon_instance: ZoomStateLiveData): ZoomState? {
        return pigeon_instance.instance.value
    }

    override fun observe(pigeon_instance: ZoomStateLiveData, observer: ZoomStateObserver) {
        val owner = impl.activity as LifecycleOwner
        pigeon_instance.instance.observe(owner, observer)
    }

    override fun removeObserver(pigeon_instance: ZoomStateLiveData, observer: ZoomStateObserver) {
        pigeon_instance.instance.removeObserver(observer)
    }
}

class CameraStateLiveData(internal val instance: LiveData<CameraState>)

class TorchStateLiveData(internal val instance: LiveData<Int>)

class ZoomStateLiveData(internal val instance: LiveData<ZoomState>)