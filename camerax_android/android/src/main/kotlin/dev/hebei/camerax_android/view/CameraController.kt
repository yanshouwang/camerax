package dev.hebei.camerax_android.view

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.map
import dev.hebei.camerax_android.core.CameraSelector
import dev.hebei.camerax_android.core.ZoomState
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
        Log.i("TAG", "begin setCameraSelector")
        withContext(Dispatchers.Main) {
            obj.cameraSelector = cameraSelector.obj
        }
        Log.i("TAG", "end setCameraSelector")
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

    suspend fun isPinchToZoomEnabled(): Boolean {
        return withContext(Dispatchers.Main) {
            obj.isPinchToZoomEnabled
        }
    }

    suspend fun setPinchToZoomEnabled(enabled: Boolean): Unit {
        withContext(Dispatchers.Main) {
            obj.isPinchToZoomEnabled = enabled
        }
    }

    suspend fun getZoomState(): LiveData<ZoomState?> {
        return withContext(Dispatchers.Main) {
            obj.zoomState.map { zoomStateObj ->
                if (zoomStateObj == null) null
                else ZoomState(zoomStateObj)
            }
        }
    }

    suspend fun setZoomRatio(zoomRatio: Float) {
        obj.setZoomRatio(zoomRatio).await()
    }

    suspend fun setLinearZoom(linearZoom: Float) {
        obj.setLinearZoom(linearZoom).await()
    }
}