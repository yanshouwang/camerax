package dev.zeekr.camerax_android.common

import androidx.camera.core.CameraState
import androidx.camera.core.ZoomState
import androidx.camera.view.PreviewView
import androidx.camera.view.TapToFocusInfo
import androidx.lifecycle.Observer
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiCameraStateObserverProxyApi
import dev.zeekr.camerax_android.PigeonApiIntObserverProxyApi
import dev.zeekr.camerax_android.PigeonApiLowLightBoostStateObserverProxyApi
import dev.zeekr.camerax_android.PigeonApiPreviewViewStreamStateObserverProxyApi
import dev.zeekr.camerax_android.PigeonApiTapToFocusInfoObserverProxyApi
import dev.zeekr.camerax_android.PigeonApiTorchStateObserverProxyApi
import dev.zeekr.camerax_android.PigeonApiZoomStateObserverProxyApi
import dev.zeekr.camerax_android.core.api
import dev.zeekr.camerax_android.core.lowLightBoostStateApi
import dev.zeekr.camerax_android.core.torchStateApi
import dev.zeekr.camerax_android.view.api

class IntObserverImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiIntObserverProxyApi(registrar) {
    override fun pigeon_defaultConstructor(): IntObserver {
        return IntObserver(this)
    }
}

class CameraStateObserverImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiCameraStateObserverProxyApi(registrar) {
    override fun pigeon_defaultConstructor(): CameraStateObserver {
        return CameraStateObserver(this)
    }
}

class TorchStateObserverImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiTorchStateObserverProxyApi(registrar) {
    override fun pigeon_defaultConstructor(): TorchStateObserver {
        return TorchStateObserver(this)
    }
}

class ZoomStateObserverImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiZoomStateObserverProxyApi(registrar) {
    override fun pigeon_defaultConstructor(): ZoomStateObserver {
        return ZoomStateObserver(this)
    }
}

class TapToFocusInfoObserverImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiTapToFocusInfoObserverProxyApi(registrar) {
    override fun pigeon_defaultConstructor(): TapToFocusInfoObserver {
        return TapToFocusInfoObserver(this)
    }
}

class LowLightBoostStateObserverImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiLowLightBoostStateObserverProxyApi(registrar) {
    override fun pigeon_defaultConstructor(): LowLightBoostStateObserver {
        return LowLightBoostStateObserver(this)
    }
}

class PreviewViewStreamStateObserverImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiPreviewViewStreamStateObserverProxyApi(registrar) {
    override fun pigeon_defaultConstructor(): PreviewViewStreamStateObserver {
        return PreviewViewStreamStateObserver(this)
    }
}

class IntObserver(private val api: PigeonApiIntObserverProxyApi) : Observer<Int> {
    override fun onChanged(value: Int) {
        api.onChanged(this, value.toLong()) {}
    }
}

class CameraStateObserver(private val api: PigeonApiCameraStateObserverProxyApi) : Observer<CameraState> {
    override fun onChanged(value: CameraState) {
        api.onChanged(this, value.api) {}
    }
}

class TorchStateObserver(private val api: PigeonApiTorchStateObserverProxyApi) : Observer<Int> {
    override fun onChanged(value: Int) {
        return api.onChanged(this, value.torchStateApi) {}
    }
}

class ZoomStateObserver(private val api: PigeonApiZoomStateObserverProxyApi) : Observer<ZoomState> {
    override fun onChanged(value: ZoomState) {
        api.onChanged(this, value) {}
    }
}

class TapToFocusInfoObserver(private val api: PigeonApiTapToFocusInfoObserverProxyApi) : Observer<TapToFocusInfo> {
    override fun onChanged(value: TapToFocusInfo) {
        api.onChanged(this, value) {}
    }
}

class LowLightBoostStateObserver(private val api: PigeonApiLowLightBoostStateObserverProxyApi) : Observer<Int> {
    override fun onChanged(value: Int) {
        api.onChanged(this, value.lowLightBoostStateApi) {}
    }
}

class PreviewViewStreamStateObserver(private val api: PigeonApiPreviewViewStreamStateObserverProxyApi) :
    Observer<PreviewView.StreamState> {
    override fun onChanged(value: PreviewView.StreamState) {
        api.onChanged(this, value.api) {}
    }
}
