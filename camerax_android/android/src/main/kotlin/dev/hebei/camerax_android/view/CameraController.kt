package dev.hebei.camerax_android.view

import android.util.Log
import androidx.annotation.FloatRange
import androidx.lifecycle.LiveData
import androidx.lifecycle.map
import dev.hebei.camerax_android.core.CameraControl
import dev.hebei.camerax_android.core.CameraInfo
import dev.hebei.camerax_android.core.CameraSelector
import dev.hebei.camerax_android.core.ZoomState
import dev.hebei.camerax_android.core.torchStateWrapper
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.guava.await
import kotlinx.coroutines.withContext

abstract class CameraController {
    internal abstract val obj: androidx.camera.view.CameraController

    suspend fun initialize() {
        Log.i("TAG", "begin initialize")
        obj.initializationFuture.await()
        Log.i("TAG", "end initialize")
    }

    suspend fun hasCamera(cameraSelector: CameraSelector): Boolean {
        return withContext(Dispatchers.Main) {
            obj.hasCamera(cameraSelector.obj)
        }
    }

    suspend fun getCameraSelector(): CameraSelector {
        return withContext(Dispatchers.Main) {
            CameraSelector(obj.cameraSelector)
        }
    }

    suspend fun setCameraSelector(cameraSelector: CameraSelector) {
        withContext(Dispatchers.Main) {
            obj.cameraSelector = cameraSelector.obj
        }
    }

    suspend fun getCameraInfo(): CameraInfo? {
        return withContext(Dispatchers.Main) {
            val cameraInfoObj = obj.cameraInfo
            if (cameraInfoObj == null) null
            else CameraInfo(cameraInfoObj)
        }
    }

    suspend fun getCameraControl(): CameraControl? {
        return withContext(Dispatchers.Main) {
            val cameraControlObj = obj.cameraControl
            if (cameraControlObj == null) null
            else CameraControl(cameraControlObj)
        }
    }

    suspend fun getTorchState(): LiveData<Boolean> {
        return withContext(Dispatchers.Main) {
            obj.torchState.map { torchStateObj -> torchStateObj.torchStateWrapper }
        }
    }

    suspend fun enableTorch(torchEnabled: Boolean) {
        obj.enableTorch(torchEnabled).await()
    }

    suspend fun getZoomState(): LiveData<ZoomState> {
        return withContext(Dispatchers.Main) {
            obj.zoomState.map { zoomStateObj ->
                ZoomState(zoomStateObj)
            }
        }
    }

    suspend fun setZoomRatio(zoomRatio: Float) {
        obj.setZoomRatio(zoomRatio).await()
    }

    suspend fun setLinearZoom(@FloatRange(from = 0.0, to = 1.0) linearZoom: Float) {
        obj.setLinearZoom(linearZoom).await()
    }

    suspend fun isPinchToZoomEnabled(): Boolean {
        return withContext(Dispatchers.Main) {
            obj.isPinchToZoomEnabled
        }
    }

    suspend fun setPinchToZoomEnabled(enabled: Boolean) {
        withContext(Dispatchers.Main) {
            obj.isPinchToZoomEnabled = enabled
        }
    }

    suspend fun isTapToFocusEnabled(): Boolean {
        return withContext(Dispatchers.Main) {
            obj.isTapToFocusEnabled
        }
    }

    suspend fun setTapToFocusEnabled(enabled: Boolean) {
        withContext(Dispatchers.Main) {
            obj.isTapToFocusEnabled = enabled
        }
    }
}