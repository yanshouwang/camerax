package dev.zeekr.camerax_android.view

import android.graphics.Bitmap
import androidx.camera.core.MeteringPointFactory
import androidx.camera.view.CameraController
import androidx.camera.view.PreviewView
import androidx.lifecycle.LifecycleOwner
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiPreviewViewProxyApi
import dev.zeekr.camerax_android.PreviewViewImplementationModeApi
import dev.zeekr.camerax_android.PreviewViewScaleTypeApi
import dev.zeekr.camerax_android.PreviewViewStreamStateApi
import dev.zeekr.camerax_android.activity
import dev.zeekr.camerax_android.common.PreviewViewStreamStateObserver
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

class PreviewViewImpl(private val registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiPreviewViewProxyApi(registrar) {
    override fun pigeon_defaultConstructor(): PreviewView {
        return PreviewView(registrar.activity).apply {
            this.implementationMode = PreviewView.ImplementationMode.COMPATIBLE
        }
    }

    override fun getBitmap(pigeon_instance: PreviewView, callback: (Result<Bitmap?>) -> Unit) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val value = pigeon_instance.bitmap
                callback(Result.success(value))
            } catch (exception: Exception) {
                callback(Result.failure(exception))
            }
        }
    }

    override fun getController(pigeon_instance: PreviewView, callback: (Result<CameraController?>) -> Unit) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val value = pigeon_instance.controller
                callback(Result.success(value))
            } catch (exception: Exception) {
                callback(Result.failure(exception))
            }
        }
    }

    override fun getImplementationMode(
        pigeon_instance: PreviewView,
        callback: (Result<PreviewViewImplementationModeApi>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val value = pigeon_instance.implementationMode.api
                callback(Result.success(value))
            } catch (exception: Exception) {
                callback(Result.failure(exception))
            }
        }
    }

    override fun getMeteringPointFactory(
        pigeon_instance: PreviewView,
        callback: (Result<MeteringPointFactory>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val value = pigeon_instance.meteringPointFactory
                callback(Result.success(value))
            } catch (exception: Exception) {
                callback(Result.failure(exception))
            }
        }
    }

    override fun getPreviewStreamState(pigeon_instance: PreviewView): PreviewViewStreamStateApi? {
        return pigeon_instance.previewStreamState.value?.api
    }

    override fun observePreviewStreamState(pigeon_instance: PreviewView, observer: PreviewViewStreamStateObserver) {
        val owner = registrar.activity as LifecycleOwner
        pigeon_instance.previewStreamState.observe(owner, observer)
    }

    override fun removePreviewStreamStateObserver(
        pigeon_instance: PreviewView,
        observer: PreviewViewStreamStateObserver
    ) {
        pigeon_instance.previewStreamState.removeObserver(observer)
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

    override fun setImplementationMode(
        pigeon_instance: PreviewView,
        implementationMode: PreviewViewImplementationModeApi,
        callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.implementationMode = implementationMode.impl
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

    override fun setScreenFlashOverlayColor(pigeon_instance: PreviewView, color: Long) {
        pigeon_instance.setScreenFlashOverlayColor(color.toInt())
    }
}

val PreviewViewImplementationModeApi.impl: PreviewView.ImplementationMode
    get() = when (this) {
        PreviewViewImplementationModeApi.COMPATIBLE -> PreviewView.ImplementationMode.COMPATIBLE
        PreviewViewImplementationModeApi.PERFORMANCE -> PreviewView.ImplementationMode.PERFORMANCE
    }

val PreviewView.ImplementationMode.api: PreviewViewImplementationModeApi
    get() = when (this) {
        PreviewView.ImplementationMode.PERFORMANCE -> PreviewViewImplementationModeApi.PERFORMANCE
        PreviewView.ImplementationMode.COMPATIBLE -> PreviewViewImplementationModeApi.COMPATIBLE
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

val PreviewViewStreamStateApi.impl: PreviewView.StreamState
    get() = when (this) {
        PreviewViewStreamStateApi.IDLE -> PreviewView.StreamState.IDLE
        PreviewViewStreamStateApi.STREAMING -> PreviewView.StreamState.STREAMING
    }


val PreviewView.StreamState.api: PreviewViewStreamStateApi
    get() = when (this) {
        PreviewView.StreamState.IDLE -> PreviewViewStreamStateApi.IDLE
        PreviewView.StreamState.STREAMING -> PreviewViewStreamStateApi.STREAMING
    }