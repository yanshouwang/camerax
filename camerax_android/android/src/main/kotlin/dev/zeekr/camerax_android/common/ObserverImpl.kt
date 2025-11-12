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

class CameraStateObserverImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiCameraStateObserverProxyApi(registrar) {
    override fun pigeon_defaultConstructor(): CameraStateObserver {
        return CameraStateObserver(this)
    }
}

class IntObserverImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiIntObserverProxyApi(registrar) {
    override fun pigeon_defaultConstructor(): IntObserver {
        return IntObserver(this)
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

class TapToFocusInfoObserverImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiTapToFocusInfoObserverProxyApi(registrar) {
    override fun pigeon_defaultConstructor(): TapToFocusInfoObserver {
        return TapToFocusInfoObserver(this)
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

class CameraStateObserver(private val impl: CameraStateObserverImpl) : Observer<CameraState> {
    override fun onChanged(value: CameraState) {
        impl.onChanged(this, value.api) {}
    }
}

class IntObserver(private val impl: IntObserverImpl) : Observer<Int> {
    override fun onChanged(value: Int) {
        impl.onChanged(this, value.toLong()) {}
    }
}

class LowLightBoostStateObserver(private val impl: LowLightBoostStateObserverImpl) : Observer<Int> {
    override fun onChanged(value: Int) {
        impl.onChanged(this, value.lowLightBoostStateApi) {}
    }
}

class PreviewViewStreamStateObserver(private val impl: PreviewViewStreamStateObserverImpl) :
    Observer<PreviewView.StreamState> {
    override fun onChanged(value: PreviewView.StreamState) {
        impl.onChanged(this, value.api) {}
    }
}

class TapToFocusInfoObserver(private val impl: TapToFocusInfoObserverImpl) : Observer<TapToFocusInfo> {
    override fun onChanged(value: TapToFocusInfo) {
        impl.onChanged(this, value) {}
    }
}

class TorchStateObserver(private val impl: TorchStateObserverImpl) : Observer<Int> {
    override fun onChanged(value: Int) {
        impl.onChanged(this, value.torchStateApi) {}
    }
}

class ZoomStateObserver(private val impl: ZoomStateObserverImpl) : Observer<ZoomState> {
    override fun onChanged(value: ZoomState) {
        impl.onChanged(this, value) {}
    }
}