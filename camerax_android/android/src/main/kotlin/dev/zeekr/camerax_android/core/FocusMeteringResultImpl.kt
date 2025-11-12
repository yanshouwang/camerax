package dev.zeekr.camerax_android.core

import androidx.camera.core.FocusMeteringResult
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiFocusMeteringResultProxyApi

class FocusMeteringResultImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiFocusMeteringResultProxyApi(registrar) {
    override fun isFocusSuccessful(pigeon_instance: FocusMeteringResult): Boolean {
        return pigeon_instance.isFocusSuccessful
    }
}