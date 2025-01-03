package dev.hebei.camerax_android.legacy.view

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiPreviewView
import dev.hebei.camerax_android.legacy.ScaleType
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

class PreviewView(private val registrar: CameraXRegistrar) : PigeonApiPreviewView(registrar) {
    override fun pigeon_defaultConstructor(): dev.hebei.camerax_android.view.PreviewView {
        val context = registrar.activity ?: registrar.context
        return dev.hebei.camerax_android.view.PreviewView(context)
    }

    override fun getController(
        pigeon_instance: dev.hebei.camerax_android.view.PreviewView,
        callback: (Result<dev.hebei.camerax_android.view.CameraController?>) -> Unit
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
        pigeon_instance: dev.hebei.camerax_android.view.PreviewView,
        controller: dev.hebei.camerax_android.view.CameraController?,
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
        pigeon_instance: dev.hebei.camerax_android.view.PreviewView,
        callback: (Result<ScaleType>) -> Unit
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
        pigeon_instance: dev.hebei.camerax_android.view.PreviewView,
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
        ScaleType.FILL_START -> dev.hebei.camerax_android.view.PreviewView.ScaleType.FILL_START
        ScaleType.FILL_CENTER -> dev.hebei.camerax_android.view.PreviewView.ScaleType.FILL_CENTER
        ScaleType.FILL_END -> dev.hebei.camerax_android.view.PreviewView.ScaleType.FILL_END
        ScaleType.FIT_START -> dev.hebei.camerax_android.view.PreviewView.ScaleType.FIT_START
        ScaleType.FIT_CENTER -> dev.hebei.camerax_android.view.PreviewView.ScaleType.FIT_CENTER
        ScaleType.FIT_END -> dev.hebei.camerax_android.view.PreviewView.ScaleType.FIT_END
    }

val dev.hebei.camerax_android.view.PreviewView.ScaleType.args
    get() = when (this) {
        dev.hebei.camerax_android.view.PreviewView.ScaleType.FILL_START -> ScaleType.FILL_START
        dev.hebei.camerax_android.view.PreviewView.ScaleType.FILL_CENTER -> ScaleType.FILL_CENTER
        dev.hebei.camerax_android.view.PreviewView.ScaleType.FILL_END -> ScaleType.FILL_END
        dev.hebei.camerax_android.view.PreviewView.ScaleType.FIT_START -> ScaleType.FIT_START
        dev.hebei.camerax_android.view.PreviewView.ScaleType.FIT_CENTER -> ScaleType.FIT_CENTER
        dev.hebei.camerax_android.view.PreviewView.ScaleType.FIT_END -> ScaleType.FIT_END
    }