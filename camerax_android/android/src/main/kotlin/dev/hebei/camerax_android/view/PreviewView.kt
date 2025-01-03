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
        when (obj.scaleType) {
            androidx.camera.view.PreviewView.ScaleType.FILL_START -> ScaleType.FILL_START
            androidx.camera.view.PreviewView.ScaleType.FILL_CENTER -> ScaleType.FILL_CENTER
            androidx.camera.view.PreviewView.ScaleType.FILL_END -> ScaleType.FILL_END
            androidx.camera.view.PreviewView.ScaleType.FIT_START -> ScaleType.FIT_START
            androidx.camera.view.PreviewView.ScaleType.FIT_CENTER -> ScaleType.FIT_CENTER
            androidx.camera.view.PreviewView.ScaleType.FIT_END -> ScaleType.FIT_END
        }
    }

    suspend fun setScaleType(scaleType: ScaleType) = withContext(Dispatchers.Main) {
        obj.scaleType = when (scaleType) {
            ScaleType.FILL_START -> androidx.camera.view.PreviewView.ScaleType.FILL_START
            ScaleType.FILL_CENTER -> androidx.camera.view.PreviewView.ScaleType.FILL_CENTER
            ScaleType.FILL_END -> androidx.camera.view.PreviewView.ScaleType.FILL_END
            ScaleType.FIT_START -> androidx.camera.view.PreviewView.ScaleType.FIT_START
            ScaleType.FIT_CENTER -> androidx.camera.view.PreviewView.ScaleType.FIT_CENTER
            ScaleType.FIT_END -> androidx.camera.view.PreviewView.ScaleType.FIT_END
        }
    }

    enum class ScaleType {
        FILL_START, FILL_CENTER, FILL_END, FIT_START, FIT_CENTER, FIT_END,
    }
}