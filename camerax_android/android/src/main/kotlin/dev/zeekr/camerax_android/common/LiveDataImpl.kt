package dev.zeekr.camerax_android.common

import androidx.camera.core.CameraState
import androidx.camera.core.ZoomState
import androidx.camera.view.PreviewView
import androidx.camera.view.TapToFocusInfo
import androidx.lifecycle.LiveData
import dev.zeekr.camerax_android.CameraStateApi
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.LowLightBoostStateApi
import dev.zeekr.camerax_android.PigeonApiCameraStateLiveDataProxyApi
import dev.zeekr.camerax_android.PigeonApiIntLiveDataProxyApi
import dev.zeekr.camerax_android.PigeonApiLowLightBoostStateLiveDataProxyApi
import dev.zeekr.camerax_android.PigeonApiPreviewViewStreamStateLiveDataProxyApi
import dev.zeekr.camerax_android.PigeonApiTapToFocusInfoLiveDataProxyApi
import dev.zeekr.camerax_android.PigeonApiTorchStateLiveDataProxyApi
import dev.zeekr.camerax_android.PigeonApiZoomStateLiveDataProxyApi
import dev.zeekr.camerax_android.PreviewViewStreamStateApi
import dev.zeekr.camerax_android.TorchStateApi
import dev.zeekr.camerax_android.core.api
import dev.zeekr.camerax_android.core.lowLightBoostStateApi
import dev.zeekr.camerax_android.core.torchStateApi
import dev.zeekr.camerax_android.view.api

class IntLiveDataImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiIntLiveDataProxyApi(registrar) {
    override fun getValue(pigeon_instance: IntLiveData): Long? {
        return pigeon_instance.instance.value?.toLong()
    }

    override fun observeForever(pigeon_instance: IntLiveData, observer: IntObserver) {
        return pigeon_instance.instance.observeForever(observer)
    }

    override fun removeObserver(pigeon_instance: IntLiveData, observer: IntObserver) {
        return pigeon_instance.instance.removeObserver(observer)
    }
}

class CameraStateLiveDataImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiCameraStateLiveDataProxyApi(registrar) {
    override fun getValue(pigeon_instance: CameraStateLiveData): CameraStateApi? {
        return pigeon_instance.instance.value?.api
    }

    override fun observeForever(pigeon_instance: CameraStateLiveData, observer: CameraStateObserver) {
        pigeon_instance.instance.observeForever(observer)
    }

    override fun removeObserver(pigeon_instance: CameraStateLiveData, observer: CameraStateObserver) {
        return pigeon_instance.instance.removeObserver(observer)
    }
}

class TorchStateLiveDataImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiTorchStateLiveDataProxyApi(registrar) {
    override fun getValue(pigeon_instance: TorchStateLiveData): TorchStateApi? {
        return pigeon_instance.instance.value?.torchStateApi
    }

    override fun observeForever(pigeon_instance: TorchStateLiveData, observer: TorchStateObserver) {
        pigeon_instance.instance.observeForever(observer)
    }

    override fun removeObserver(pigeon_instance: TorchStateLiveData, observer: TorchStateObserver) {
        pigeon_instance.instance.removeObserver(observer)
    }
}

class ZoomStateLiveDataImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiZoomStateLiveDataProxyApi(registrar) {
    override fun getValue(pigeon_instance: ZoomStateLiveData): ZoomState? {
        return pigeon_instance.instance.value
    }

    override fun observeForever(pigeon_instance: ZoomStateLiveData, observer: ZoomStateObserver) {
        return pigeon_instance.instance.observeForever(observer)
    }

    override fun removeObserver(pigeon_instance: ZoomStateLiveData, observer: ZoomStateObserver) {
        return pigeon_instance.instance.removeObserver(observer)
    }
}

class TapToFocusInfoLiveDataImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiTapToFocusInfoLiveDataProxyApi(registrar) {
    override fun getValue(pigeon_instance: TapToFocusInfoLiveData): TapToFocusInfo? {
        return pigeon_instance.instance.value
    }

    override fun observeForever(pigeon_instance: TapToFocusInfoLiveData, observer: TapToFocusInfoObserver) {
        return pigeon_instance.instance.observeForever(observer)
    }

    override fun removeObserver(pigeon_instance: TapToFocusInfoLiveData, observer: TapToFocusInfoObserver) {
        return pigeon_instance.instance.removeObserver(observer)
    }
}

class LowLightBoostStateLiveDataImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiLowLightBoostStateLiveDataProxyApi(registrar) {
    override fun getValue(pigeon_instance: LowLightBoostStateLiveData): LowLightBoostStateApi? {
        return pigeon_instance.instance.value?.lowLightBoostStateApi
    }

    override fun observeForever(pigeon_instance: LowLightBoostStateLiveData, observer: LowLightBoostStateObserver) {
        pigeon_instance.instance.observeForever(observer)
    }

    override fun removeObserver(pigeon_instance: LowLightBoostStateLiveData, observer: LowLightBoostStateObserver) {
        pigeon_instance.instance.removeObserver(observer)
    }
}

class PreviewViewStreamStateLiveDataImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiPreviewViewStreamStateLiveDataProxyApi(registrar) {
    override fun getValue(pigeon_instance: PreviewViewStreamStateLiveData): PreviewViewStreamStateApi? {
        return pigeon_instance.instance.value?.api
    }

    override fun observeForever(
        pigeon_instance: PreviewViewStreamStateLiveData, observer: PreviewViewStreamStateObserver
    ) {
        return pigeon_instance.instance.observeForever(observer)
    }

    override fun removeObserver(
        pigeon_instance: PreviewViewStreamStateLiveData, observer: PreviewViewStreamStateObserver
    ) {
        return pigeon_instance.instance.removeObserver(observer)
    }
}

class IntLiveData(val instance: LiveData<Int>)
class CameraStateLiveData(val instance: LiveData<CameraState>)
class TorchStateLiveData(val instance: LiveData<Int>)
class ZoomStateLiveData(val instance: LiveData<ZoomState>)
class TapToFocusInfoLiveData(val instance: LiveData<TapToFocusInfo>)
class LowLightBoostStateLiveData(val instance: LiveData<Int>)
class PreviewViewStreamStateLiveData(val instance: LiveData<PreviewView.StreamState>)