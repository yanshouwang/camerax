package dev.hebei.camerax_android.core

import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.PigeonApiFocusMeteringResultApi

class FocusMeteringResultImpl(impl: CameraXImpl) : PigeonApiFocusMeteringResultApi(impl) {
    override fun isFocusSuccessful(pigeon_instance: androidx.camera.core.FocusMeteringResult): Boolean {
        return pigeon_instance.isFocusSuccessful
    }
}