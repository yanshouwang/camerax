package dev.hebei.camerax_android.core

import androidx.camera.core.FocusMeteringResult
import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.PigeonApiFocusMeteringResultApi

class FocusMeteringResultImpl(impl: CameraXImpl) : PigeonApiFocusMeteringResultApi(impl) {
    override fun isFocusSuccessful(pigeon_instance: FocusMeteringResult): Boolean {
        return pigeon_instance.isFocusSuccessful
    }
}