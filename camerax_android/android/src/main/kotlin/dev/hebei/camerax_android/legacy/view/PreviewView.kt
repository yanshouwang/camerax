package dev.hebei.camerax_android.legacy.view

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiPreviewView
import dev.hebei.camerax_android.legacy.ScaleType
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

class PreviewView(private val registrar: CameraXRegistrar) : PigeonApiPreviewView(registrar) {
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
                val controller = pigeon_instance.getController()
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
                pigeon_instance.setController(controller)
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun getScaleType(
        pigeon_instance: androidx.camera.view.PreviewView, callback: (Result<ScaleType>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val scaleType = pigeon_instance.getScaleType()
                callback(Result.success(scaleType.args))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setScaleType(
        pigeon_instance: androidx.camera.view.PreviewView,
        scaleType: ScaleType,
        callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.setScaleType(scaleType.obj)
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }
}

val ScaleType.obj
    get() = when (this) {
        ScaleType.FILL_START -> androidx.camera.view.PreviewView.ScaleType.FILL_START
        ScaleType.FILL_CENTER -> androidx.camera.view.PreviewView.ScaleType.FILL_CENTER
        ScaleType.FILL_END -> androidx.camera.view.PreviewView.ScaleType.FILL_END
        ScaleType.FIT_START -> androidx.camera.view.PreviewView.ScaleType.FIT_START
        ScaleType.FIT_CENTER -> androidx.camera.view.PreviewView.ScaleType.FIT_CENTER
        ScaleType.FIT_END -> androidx.camera.view.PreviewView.ScaleType.FIT_END
    }

val androidx.camera.view.PreviewView.ScaleType.args
    get() = when (this) {
        androidx.camera.view.PreviewView.ScaleType.FILL_START -> ScaleType.FILL_START
        androidx.camera.view.PreviewView.ScaleType.FILL_CENTER -> ScaleType.FILL_CENTER
        androidx.camera.view.PreviewView.ScaleType.FILL_END -> ScaleType.FILL_END
        androidx.camera.view.PreviewView.ScaleType.FIT_START -> ScaleType.FIT_START
        androidx.camera.view.PreviewView.ScaleType.FIT_CENTER -> ScaleType.FIT_CENTER
        androidx.camera.view.PreviewView.ScaleType.FIT_END -> ScaleType.FIT_END
    }