package dev.hebei.camerax_android.legacy.view

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiCameraController
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

class CameraController(registrar: CameraXRegistrar) : PigeonApiCameraController(registrar) {
    override fun initialize(
        pigeon_instance: dev.hebei.camerax_android.view.CameraController,
        callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.initialize()
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun hasCamera(
        pigeon_instance: dev.hebei.camerax_android.view.CameraController,
        cameraSelector: dev.hebei.camerax_android.core.CameraSelector,
        callback: (Result<Boolean>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val hasCamera = pigeon_instance.hasCamera(cameraSelector)
                callback(Result.success(hasCamera))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun getCameraSelector(
        pigeon_instance: dev.hebei.camerax_android.view.CameraController,
        callback: (Result<dev.hebei.camerax_android.core.CameraSelector>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val cameraSelector = pigeon_instance.getCameraSelector()
                callback(Result.success(cameraSelector))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setCameraSelector(
        pigeon_instance: dev.hebei.camerax_android.view.CameraController,
        cameraSelector: dev.hebei.camerax_android.core.CameraSelector,
        callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.setCameraSelector(cameraSelector)
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun isTapToFocusEnabled(
        pigeon_instance: dev.hebei.camerax_android.view.CameraController,
        callback: (Result<Boolean>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val enabled = pigeon_instance.isTapToFocusEnabled()
                callback(Result.success(enabled))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setTapToFocusEnabled(
        pigeon_instance: dev.hebei.camerax_android.view.CameraController,
        enabled: Boolean,
        callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.setTapToFocusEnabled(enabled)
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun isPinchToZoomEnabled(
        pigeon_instance: dev.hebei.camerax_android.view.CameraController,
        callback: (Result<Boolean>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val enabled = pigeon_instance.isPinchToZoomEnabled()
                callback(Result.success(enabled))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setPinchToZoomEnabled(
        pigeon_instance: dev.hebei.camerax_android.view.CameraController,
        enabled: Boolean,
        callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.setPinchToZoomEnabled(enabled)
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }
}