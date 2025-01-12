package dev.hebei.camerax_android.core

import androidx.annotation.FloatRange
import kotlinx.coroutines.guava.await

class CameraControl internal constructor(val obj: androidx.camera.core.CameraControl) {

    suspend fun enableTorch(torch: Boolean) {
        obj.enableTorch(torch).await()
    }

    suspend fun setZoomRatio(ratio: Float) {
        obj.setZoomRatio(ratio).await()
    }

    suspend fun setLinearZoom(@FloatRange(from = 0.0, to = 1.0) linearZoom: Float) {
        obj.setLinearZoom(linearZoom).await()
    }

    suspend fun startFocusAndMetering(action: FocusMeteringAction): Boolean {
        val result = obj.startFocusAndMetering(action.obj).await()
        return result.isFocusSuccessful
    }

    suspend fun cancelFocusAndMetering() {
        obj.cancelFocusAndMetering().await()
    }

    suspend fun setExposureCompensationIndex(value: Int): Int {
        return obj.setExposureCompensationIndex(value).await()
    }
}