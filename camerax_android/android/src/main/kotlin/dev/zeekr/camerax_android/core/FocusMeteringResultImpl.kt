package dev.zeekr.camerax_android.core

import androidx.camera.core.FocusMeteringResult
import dev.zeekr.camerax_android.CameraXRegistrarImpl
import dev.zeekr.camerax_android.PigeonApiFocusMeteringResultApi

class FocusMeteringResultImpl(impl: CameraXRegistrarImpl) : PigeonApiFocusMeteringResultApi(impl) {
    override fun isFocusSuccessful(pigeon_instance: FocusMeteringResult): Boolean {
        return pigeon_instance.isFocusSuccessful
    }
}