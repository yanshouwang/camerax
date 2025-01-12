package dev.hebei.camerax_android.legacy.core

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiFocusMeteringResult

class FocusMeteringResult(registrar: CameraXRegistrar) : PigeonApiFocusMeteringResult(registrar) {
    override fun isFocusSuccessful(pigeon_instance: androidx.camera.core.FocusMeteringResult): Boolean {
        return pigeon_instance.isFocusSuccessful
    }
}