package dev.zeekr.camerax_android.view

import androidx.camera.view.CameraController
import androidx.camera.view.PreviewView
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiPreviewViewApi
import dev.zeekr.camerax_android.PreviewViewScaleTypeApi
import dev.zeekr.camerax_android.activity
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

class PreviewViewImpl(private val registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiPreviewViewApi(registrar) {
    override fun pigeon_defaultConstructor(): PreviewView {
        return PreviewView(registrar.activity).apply {
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

    override fun getScaleType(pigeon_instance: PreviewView, callback: (Result<PreviewViewScaleTypeApi>) -> Unit) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                callback(Result.success(pigeon_instance.scaleType.api))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setScaleType(
        pigeon_instance: PreviewView,
        scaleType: PreviewViewScaleTypeApi,
        callback: (Result<Unit>) -> Unit
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

val PreviewViewScaleTypeApi.impl: PreviewView.ScaleType
    get() = when (this) {
        PreviewViewScaleTypeApi.FILL_START -> PreviewView.ScaleType.FILL_START
        PreviewViewScaleTypeApi.FILL_CENTER -> PreviewView.ScaleType.FILL_CENTER
        PreviewViewScaleTypeApi.FILL_END -> PreviewView.ScaleType.FILL_END
        PreviewViewScaleTypeApi.FIT_START -> PreviewView.ScaleType.FIT_START
        PreviewViewScaleTypeApi.FIT_CENTER -> PreviewView.ScaleType.FIT_CENTER
        PreviewViewScaleTypeApi.FIT_END -> PreviewView.ScaleType.FIT_END
    }

val PreviewView.ScaleType.api: PreviewViewScaleTypeApi
    get() = when (this) {
        PreviewView.ScaleType.FILL_START -> PreviewViewScaleTypeApi.FILL_START
        PreviewView.ScaleType.FILL_CENTER -> PreviewViewScaleTypeApi.FILL_CENTER
        PreviewView.ScaleType.FILL_END -> PreviewViewScaleTypeApi.FILL_END
        PreviewView.ScaleType.FIT_START -> PreviewViewScaleTypeApi.FIT_START
        PreviewView.ScaleType.FIT_CENTER -> PreviewViewScaleTypeApi.FIT_CENTER
        PreviewView.ScaleType.FIT_END -> PreviewViewScaleTypeApi.FIT_END
    }