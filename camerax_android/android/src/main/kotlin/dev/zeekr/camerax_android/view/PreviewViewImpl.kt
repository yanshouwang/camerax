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
import dev.zeekr.camerax_android.common.PreviewViewStreamStateLiveData
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

    override fun getBitmap(pigeon_instance: PreviewView): Bitmap? {
        return pigeon_instance.bitmap
    }

    override fun getController(pigeon_instance: PreviewView): CameraController? {
        return pigeon_instance.controller
    }

    override fun getImplementationMode(pigeon_instance: PreviewView): PreviewViewImplementationModeApi {
        return pigeon_instance.implementationMode.api
    }

    override fun getMeteringPointFactory(pigeon_instance: PreviewView): MeteringPointFactory {
        return pigeon_instance.meteringPointFactory
    }

    override fun getPreviewStreamState(pigeon_instance: PreviewView): PreviewViewStreamStateLiveData {
        return PreviewViewStreamStateLiveData(pigeon_instance.previewStreamState)
    }

    override fun setController(pigeon_instance: PreviewView, controller: CameraController?) {
        pigeon_instance.controller = controller
    }

    override fun setImplementationMode(
        pigeon_instance: PreviewView, implementationMode: PreviewViewImplementationModeApi
    ) {
        pigeon_instance.implementationMode = implementationMode.impl
    }

    override fun getScaleType(pigeon_instance: PreviewView): PreviewViewScaleTypeApi {
        return pigeon_instance.scaleType.api
    }

    override fun setScaleType(pigeon_instance: PreviewView, scaleType: PreviewViewScaleTypeApi) {
        pigeon_instance.scaleType = scaleType.impl
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