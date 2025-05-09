package dev.hebei.camerax_android.view

import dev.hebei.camerax_android.CameraXRegistrar
import dev.hebei.camerax_android.PigeonApiPreviewViewApi
import dev.hebei.camerax_android.ScaleTypeApi
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

class PreviewViewImpl(private val registrar: CameraXRegistrar) : PigeonApiPreviewViewApi(registrar) {
    override fun pigeon_defaultConstructor(): androidx.camera.view.PreviewView {
        val context = registrar.activity ?: registrar.context
        return androidx.camera.view.PreviewView(context).apply {
            this.implementationMode = androidx.camera.view.PreviewView.ImplementationMode.COMPATIBLE
        }
    }

    override fun getController(
        pigeon_instance: androidx.camera.view.PreviewView,
        callback: (Result<androidx.camera.view.CameraController?>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val controller = pigeon_instance.controller
                callback(Result.success(controller))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setController(
        pigeon_instance: androidx.camera.view.PreviewView,
        controller: androidx.camera.view.CameraController?,
        callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.controller = controller
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun getScaleType(
        pigeon_instance: androidx.camera.view.PreviewView, callback: (Result<ScaleTypeApi>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val scaleType = pigeon_instance.scaleType
                callback(Result.success(scaleType.api))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setScaleType(
        pigeon_instance: androidx.camera.view.PreviewView, scaleType: ScaleTypeApi, callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.scaleType = scaleType.impl
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }
}

val ScaleTypeApi.impl
    get() = when (this) {
        ScaleTypeApi.FILL_START -> androidx.camera.view.PreviewView.ScaleType.FILL_START
        ScaleTypeApi.FILL_CENTER -> androidx.camera.view.PreviewView.ScaleType.FILL_CENTER
        ScaleTypeApi.FILL_END -> androidx.camera.view.PreviewView.ScaleType.FILL_END
        ScaleTypeApi.FIT_START -> androidx.camera.view.PreviewView.ScaleType.FIT_START
        ScaleTypeApi.FIT_CENTER -> androidx.camera.view.PreviewView.ScaleType.FIT_CENTER
        ScaleTypeApi.FIT_END -> androidx.camera.view.PreviewView.ScaleType.FIT_END
    }

val androidx.camera.view.PreviewView.ScaleType.api
    get() = when (this) {
        androidx.camera.view.PreviewView.ScaleType.FILL_START -> ScaleTypeApi.FILL_START
        androidx.camera.view.PreviewView.ScaleType.FILL_CENTER -> ScaleTypeApi.FILL_CENTER
        androidx.camera.view.PreviewView.ScaleType.FILL_END -> ScaleTypeApi.FILL_END
        androidx.camera.view.PreviewView.ScaleType.FIT_START -> ScaleTypeApi.FIT_START
        androidx.camera.view.PreviewView.ScaleType.FIT_CENTER -> ScaleTypeApi.FIT_CENTER
        androidx.camera.view.PreviewView.ScaleType.FIT_END -> ScaleTypeApi.FIT_END
    }