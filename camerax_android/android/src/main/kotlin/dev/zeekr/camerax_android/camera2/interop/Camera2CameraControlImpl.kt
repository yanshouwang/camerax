package dev.zeekr.camerax_android.camera2.interop

import androidx.annotation.OptIn
import androidx.camera.camera2.interop.Camera2CameraControl
import androidx.camera.camera2.interop.CaptureRequestOptions
import androidx.camera.camera2.interop.ExperimentalCamera2Interop
import androidx.camera.core.CameraControl
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiCamera2CameraControlProxyApi
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.guava.await
import kotlinx.coroutines.launch

@OptIn(ExperimentalCamera2Interop::class)
class Camera2CameraControlImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiCamera2CameraControlProxyApi(registrar) {
    override fun from(cameraControl: CameraControl): Camera2CameraControl {
        return Camera2CameraControl.from(cameraControl)
    }

    override fun addCaptureRequestOptions(
        pigeon_instance: Camera2CameraControl, bundle: CaptureRequestOptions, callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.addCaptureRequestOptions(bundle).await()
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun clearCaptureRequestOptions(pigeon_instance: Camera2CameraControl, callback: (Result<Unit>) -> Unit) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.clearCaptureRequestOptions().await()
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun getCaptureRequestOptions(pigeon_instance: Camera2CameraControl): CaptureRequestOptions {
        return pigeon_instance.captureRequestOptions
    }

    override fun setCaptureRequestOptions(
        pigeon_instance: Camera2CameraControl, bundle: CaptureRequestOptions, callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.setCaptureRequestOptions(bundle).await()
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }
}