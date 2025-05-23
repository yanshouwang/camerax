package dev.hebei.camerax_android.core

import androidx.camera.core.CameraControl
import androidx.camera.core.FocusMeteringAction
import androidx.camera.core.FocusMeteringResult
import androidx.core.content.ContextCompat
import com.google.common.util.concurrent.FutureCallback
import com.google.common.util.concurrent.Futures
import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.PigeonApiCameraControlApi

class CameraControlImpl(private val impl: CameraXImpl) : PigeonApiCameraControlApi(impl) {
    override fun enableTorch(pigeon_instance: CameraControl, torch: Boolean, callback: (Result<Unit>) -> Unit) {
        val future = pigeon_instance.enableTorch(torch)
        val executor = ContextCompat.getMainExecutor(impl.context)
        Futures.addCallback(future, object : FutureCallback<Void> {
            override fun onSuccess(result: Void?) {
                callback(Result.success(Unit))
            }

            override fun onFailure(t: Throwable) {
                callback(Result.failure(t))
            }
        }, executor)
    }

    override fun setZoomRatio(pigeon_instance: CameraControl, ratio: Double, callback: (Result<Unit>) -> Unit) {
        val future = pigeon_instance.setZoomRatio(ratio.toFloat())
        val executor = ContextCompat.getMainExecutor(impl.context)
        Futures.addCallback(future, object : FutureCallback<Void> {
            override fun onSuccess(result: Void?) {
                callback(Result.success(Unit))
            }

            override fun onFailure(t: Throwable) {
                callback(Result.failure(t))
            }
        }, executor)
    }

    override fun setLinearZoom(
        pigeon_instance: CameraControl, linearZoom: Double, callback: (Result<Unit>) -> Unit
    ) {
        val future = pigeon_instance.setLinearZoom(linearZoom.toFloat())
        val executor = ContextCompat.getMainExecutor(impl.context)
        Futures.addCallback(future, object : FutureCallback<Void> {
            override fun onSuccess(result: Void?) {
                callback(Result.success(Unit))
            }

            override fun onFailure(t: Throwable) {
                callback(Result.failure(t))
            }
        }, executor)
    }

    override fun startFocusAndMetering(
        pigeon_instance: CameraControl, action: FocusMeteringAction, callback: (Result<FocusMeteringResult>) -> Unit
    ) {
        val future = pigeon_instance.startFocusAndMetering(action)
        val executor = ContextCompat.getMainExecutor(impl.context)
        Futures.addCallback(
            future, object : FutureCallback<FocusMeteringResult> {
                override fun onSuccess(result: FocusMeteringResult) {
                    callback(Result.success(result))
                }

                override fun onFailure(t: Throwable) {
                    callback(Result.failure(t))
                }
            }, executor
        )
    }

    override fun cancelFocusAndMetering(pigeon_instance: CameraControl, callback: (Result<Unit>) -> Unit) {
        val future = pigeon_instance.cancelFocusAndMetering()
        val executor = ContextCompat.getMainExecutor(impl.context)
        Futures.addCallback(future, object : FutureCallback<Void> {
            override fun onSuccess(result: Void?) {
                callback(Result.success(Unit))
            }

            override fun onFailure(t: Throwable) {
                callback(Result.failure(t))
            }
        }, executor)
    }

    override fun setExposureCompensationIndex(
        pigeon_instance: CameraControl, value: Long, callback: (Result<Long>) -> Unit
    ) {
        val future = pigeon_instance.setExposureCompensationIndex(value.toInt())
        val executor = ContextCompat.getMainExecutor(impl.context)
        Futures.addCallback(future, object : FutureCallback<Int> {
            override fun onSuccess(result: Int) {
                callback(Result.success(result.toLong()))
            }

            override fun onFailure(t: Throwable) {
                callback(Result.failure(t))
            }
        }, executor)
    }
}