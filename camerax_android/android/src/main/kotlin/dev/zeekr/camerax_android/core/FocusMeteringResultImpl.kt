package dev.zeekr.camerax_android.core

import androidx.camera.core.FocusMeteringResult
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiFocusMeteringResultApi

class FocusMeteringResultImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiFocusMeteringResultApi(registrar) {
    override fun isFocusSuccessful(pigeon_instance: FocusMeteringResult): Boolean {
        return pigeon_instance.isFocusSuccessful
    }
}