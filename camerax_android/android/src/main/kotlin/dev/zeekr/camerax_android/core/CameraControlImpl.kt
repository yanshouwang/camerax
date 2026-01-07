package dev.zeekr.camerax_android.core

import androidx.camera.core.CameraControl
import androidx.camera.core.FocusMeteringAction
import androidx.camera.core.FocusMeteringResult
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiCameraControlProxyApi
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.guava.await
import kotlinx.coroutines.launch

class CameraControlImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiCameraControlProxyApi(registrar) {
    override fun enableTorch(pigeon_instance: CameraControl, torch: Boolean, callback: (Result<Unit>) -> Unit) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.enableTorch(torch).await()
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setZoomRatio(pigeon_instance: CameraControl, ratio: Double, callback: (Result<Unit>) -> Unit) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.setZoomRatio(ratio.toFloat()).await()
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setLinearZoom(pigeon_instance: CameraControl, linearZoom: Double, callback: (Result<Unit>) -> Unit) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.setLinearZoom(linearZoom.toFloat()).await()
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setTorchStrengthLevel(
        pigeon_instance: CameraControl, torchStrengthLevel: Long, callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.setTorchStrengthLevel(torchStrengthLevel.toInt()).await()
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun startFocusAndMetering(
        pigeon_instance: CameraControl, action: FocusMeteringAction, callback: (Result<FocusMeteringResult>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val result = pigeon_instance.startFocusAndMetering(action).await()
                callback(Result.success(result))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun cancelFocusAndMetering(pigeon_instance: CameraControl, callback: (Result<Unit>) -> Unit) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.cancelFocusAndMetering().await()
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun enableLowLightBoostAsync(
        pigeon_instance: CameraControl, lowLightBoost: Boolean, callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.enableLowLightBoostAsync(lowLightBoost).await()
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setExposureCompensationIndex(
        pigeon_instance: CameraControl, value: Long, callback: (Result<Long>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val newValue = pigeon_instance.setExposureCompensationIndex(value.toInt()).await().toLong()
                callback(Result.success(newValue))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }
}