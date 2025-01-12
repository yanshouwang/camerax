package dev.hebei.camerax_android.view

import android.content.Context
import android.view.View
import io.flutter.plugin.platform.PlatformView
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext

class PreviewView(context: Context) : PlatformView {
    private val obj = androidx.camera.view.PreviewView(context)

    override fun getView(): View {
        return obj
    }

    override fun dispose() {
    }

    suspend fun getController() = withContext(Dispatchers.Main) {
        when (val controllerObj = obj.controller) {
            null -> null
            is androidx.camera.view.LifecycleCameraController -> LifecycleCameraController(
                controllerObj
            )

            else -> throw NotImplementedError()
        }
    }

    suspend fun setController(controller: CameraController?) = withContext(Dispatchers.Main) {
        obj.controller = controller?.obj
    }

    suspend fun getScaleType() = withContext(Dispatchers.Main) {
        obj.scaleType.args
    }

    suspend fun setScaleType(scaleType: ScaleType) = withContext(Dispatchers.Main) {
        obj.scaleType = scaleType.obj
    }

    enum class ScaleType {
        FILL_START, FILL_CENTER, FILL_END, FIT_START, FIT_CENTER, FIT_END,
    }
}

val PreviewView.ScaleType.obj
    get() = when (this) {
        PreviewView.ScaleType.FILL_START -> androidx.camera.view.PreviewView.ScaleType.FILL_START
        PreviewView.ScaleType.FILL_CENTER -> androidx.camera.view.PreviewView.ScaleType.FILL_CENTER
        PreviewView.ScaleType.FILL_END -> androidx.camera.view.PreviewView.ScaleType.FILL_END
        PreviewView.ScaleType.FIT_START -> androidx.camera.view.PreviewView.ScaleType.FIT_START
        PreviewView.ScaleType.FIT_CENTER -> androidx.camera.view.PreviewView.ScaleType.FIT_CENTER
        PreviewView.ScaleType.FIT_END -> androidx.camera.view.PreviewView.ScaleType.FIT_END
    }

val androidx.camera.view.PreviewView.ScaleType.args
    get() = when (this) {
        androidx.camera.view.PreviewView.ScaleType.FILL_START -> PreviewView.ScaleType.FILL_START
        androidx.camera.view.PreviewView.ScaleType.FILL_CENTER -> PreviewView.ScaleType.FILL_CENTER
        androidx.camera.view.PreviewView.ScaleType.FILL_END -> PreviewView.ScaleType.FILL_END
        androidx.camera.view.PreviewView.ScaleType.FIT_START -> PreviewView.ScaleType.FIT_START
        androidx.camera.view.PreviewView.ScaleType.FIT_CENTER -> PreviewView.ScaleType.FIT_CENTER
        androidx.camera.view.PreviewView.ScaleType.FIT_END -> PreviewView.ScaleType.FIT_END
    }