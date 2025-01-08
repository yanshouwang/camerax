package dev.hebei.camerax_android.legacy.core

import dev.hebei.camerax_android.core.CameraControl
import dev.hebei.camerax_android.core.FocusMeteringAction
import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiCameraControl
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

class CameraControl(registrar: CameraXRegistrar) : PigeonApiCameraControl(registrar) {
    override fun enableTorch(
        pigeon_instance: CameraControl, torch: Boolean, callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Default).launch {
            try {
                pigeon_instance.enableTorch(torch)
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setZoomRatio(
        pigeon_instance: CameraControl, ratio: Double, callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Default).launch {
            try {
                pigeon_instance.setZoomRatio(ratio.toFloat())
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setLinearZoom(
        pigeon_instance: CameraControl, linearZoom: Double, callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Default).launch {
            try {
                pigeon_instance.setLinearZoom(linearZoom.toFloat())
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun startFocusAndMetering(
        pigeon_instance: CameraControl,
        action: FocusMeteringAction,
        callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Default).launch {
            try {
                pigeon_instance.startFocusAndMetering(action)
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun cancelFocusAndMetering(
        pigeon_instance: CameraControl, callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Default).launch {
            try {
                pigeon_instance.cancelFocusAndMetering()
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setExposureCompensationIndex(
        pigeon_instance: CameraControl, value: Long, callback: (Result<Long>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Default).launch {
            try {
                val newValue = pigeon_instance.setExposureCompensationIndex(value.toInt())
                callback(Result.success(newValue.toLong()))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }
}