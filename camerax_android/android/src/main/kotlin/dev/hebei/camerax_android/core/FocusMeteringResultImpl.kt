package dev.hebei.camerax_android.core

import dev.hebei.camerax_android.CameraXRegistrar
import dev.hebei.camerax_android.PigeonApiFocusMeteringResultApi

class FocusMeteringResultImpl(registrar: CameraXRegistrar) : PigeonApiFocusMeteringResultApi(registrar) {
    override fun isFocusSuccessful(pigeon_instance: androidx.camera.core.FocusMeteringResult): Boolean {
        return pigeon_instance.isFocusSuccessful
    }
}