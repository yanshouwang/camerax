package dev.hebei.camerax_android.view

import androidx.camera.view.CameraController
import androidx.camera.view.PreviewView
import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.PigeonApiPreviewViewApi
import dev.hebei.camerax_android.ScaleTypeApi
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

class PreviewViewImpl(private val impl: CameraXImpl) : PigeonApiPreviewViewApi(impl) {
    override fun pigeon_defaultConstructor(): PreviewView {
        val context = impl.activity ?: impl.context
        return PreviewView(context).apply {
            this.implementationMode = PreviewView.ImplementationMode.COMPATIBLE
        }
    }

    override fun getController(pigeon_instance: PreviewView, callback: (Result<CameraController?>) -> Unit) {
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
        pigeon_instance: PreviewView, controller: CameraController?, callback: (Result<Unit>) -> Unit
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

    override fun getScaleType(pigeon_instance: PreviewView, callback: (Result<ScaleTypeApi>) -> Unit) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val scaleType = pigeon_instance.scaleType
                callback(Result.success(scaleType.api))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setScaleType(pigeon_instance: PreviewView, scaleType: ScaleTypeApi, callback: (Result<Unit>) -> Unit) {
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
        ScaleTypeApi.FILL_START -> PreviewView.ScaleType.FILL_START
        ScaleTypeApi.FILL_CENTER -> PreviewView.ScaleType.FILL_CENTER
        ScaleTypeApi.FILL_END -> PreviewView.ScaleType.FILL_END
        ScaleTypeApi.FIT_START -> PreviewView.ScaleType.FIT_START
        ScaleTypeApi.FIT_CENTER -> PreviewView.ScaleType.FIT_CENTER
        ScaleTypeApi.FIT_END -> PreviewView.ScaleType.FIT_END
    }

val PreviewView.ScaleType.api
    get() = when (this) {
        PreviewView.ScaleType.FILL_START -> ScaleTypeApi.FILL_START
        PreviewView.ScaleType.FILL_CENTER -> ScaleTypeApi.FILL_CENTER
        PreviewView.ScaleType.FILL_END -> ScaleTypeApi.FILL_END
        PreviewView.ScaleType.FIT_START -> ScaleTypeApi.FIT_START
        PreviewView.ScaleType.FIT_CENTER -> ScaleTypeApi.FIT_CENTER
        PreviewView.ScaleType.FIT_END -> ScaleTypeApi.FIT_END
    }