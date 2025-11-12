package dev.zeekr.camerax_android.camera2.interop

import androidx.annotation.OptIn
import androidx.camera.camera2.interop.Camera2CameraControl
import androidx.camera.camera2.interop.CaptureRequestOptions
import androidx.camera.camera2.interop.ExperimentalCamera2Interop
import androidx.camera.core.CameraControl
import androidx.core.content.ContextCompat
import com.google.common.util.concurrent.FutureCallback
import com.google.common.util.concurrent.Futures
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiCamera2CameraControlProxyApi
import dev.zeekr.camerax_android.context

@OptIn(ExperimentalCamera2Interop::class)
class Camera2CameraControlImpl(private val registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiCamera2CameraControlProxyApi(registrar) {
    override fun from(cameraControl: CameraControl): Camera2CameraControl {
        return Camera2CameraControl.from(cameraControl)
    }

    override fun addCaptureRequestOptions(
        pigeon_instance: Camera2CameraControl, bundle: CaptureRequestOptions, callback: (Result<Unit>) -> Unit
    ) {
        val future = pigeon_instance.addCaptureRequestOptions(bundle)
        val executor = ContextCompat.getMainExecutor(registrar.context)
        Futures.addCallback(future, object : FutureCallback<Void> {
            override fun onSuccess(result: Void?) {
                callback(Result.success(Unit))
            }

            override fun onFailure(t: Throwable) {
                callback(Result.failure(t))
            }
        }, executor)
    }

    override fun clearCaptureRequestOptions(pigeon_instance: Camera2CameraControl, callback: (Result<Unit>) -> Unit) {
        val future = pigeon_instance.clearCaptureRequestOptions()
        val executor = ContextCompat.getMainExecutor(registrar.context)
        Futures.addCallback(future, object : FutureCallback<Void> {
            override fun onSuccess(result: Void?) {
                callback(Result.success(Unit))
            }

            override fun onFailure(t: Throwable) {
                callback(Result.failure(t))
            }
        }, executor)
    }

    override fun getCaptureRequestOptions(pigeon_instance: Camera2CameraControl): CaptureRequestOptions {
        return pigeon_instance.captureRequestOptions
    }

    override fun setCaptureRequestOptions(
        pigeon_instance: Camera2CameraControl, bundle: CaptureRequestOptions, callback: (Result<Unit>) -> Unit
    ) {
        val future = pigeon_instance.setCaptureRequestOptions(bundle)
        val executor = ContextCompat.getMainExecutor(registrar.context)
        Futures.addCallback(future, object : FutureCallback<Void> {
            override fun onSuccess(result: Void?) {
                callback(Result.success(Unit))
            }

            override fun onFailure(t: Throwable) {
                callback(Result.failure(t))
            }
        }, executor)
    }
}