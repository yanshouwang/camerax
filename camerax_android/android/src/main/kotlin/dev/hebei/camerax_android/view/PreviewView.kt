package dev.hebei.camerax_android.view

import android.content.Context
import android.view.View
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext

class PreviewView(context: Context, private val viewId: Int, args: Any?) : PlatformView {
    private val view = androidx.camera.view.PreviewView(context)

    init {
        Factory.addView(viewId, this)
    }

    override fun getView(): View {
        return view
    }

    override fun dispose() {
        Factory.removeView(viewId)
    }

    suspend fun getController() = withContext(Dispatchers.Main) {
        when (val controllerObj = view.controller) {
            null -> null
            is androidx.camera.view.LifecycleCameraController -> LifecycleCameraController(
                controllerObj
            )

            else -> throw NotImplementedError()
        }
    }

    suspend fun setController(controller: CameraController) = withContext(Dispatchers.Main) {
        view.controller = controller.obj
    }

    suspend fun getScaleType() = withContext(Dispatchers.Main) {
        when (view.scaleType) {
            androidx.camera.view.PreviewView.ScaleType.FILL_START -> ScaleType.FILL_START
            androidx.camera.view.PreviewView.ScaleType.FILL_CENTER -> ScaleType.FILL_CENTER
            androidx.camera.view.PreviewView.ScaleType.FILL_END -> ScaleType.FILL_END
            androidx.camera.view.PreviewView.ScaleType.FIT_START -> ScaleType.FIT_START
            androidx.camera.view.PreviewView.ScaleType.FIT_CENTER -> ScaleType.FIT_CENTER
            androidx.camera.view.PreviewView.ScaleType.FIT_END -> ScaleType.FIT_END
        }
    }

    suspend fun setScaleType(scaleType: ScaleType) = withContext(Dispatchers.Main) {
        view.scaleType = when (scaleType) {
            ScaleType.FILL_START -> androidx.camera.view.PreviewView.ScaleType.FILL_START
            ScaleType.FILL_CENTER -> androidx.camera.view.PreviewView.ScaleType.FILL_CENTER
            ScaleType.FILL_END -> androidx.camera.view.PreviewView.ScaleType.FILL_END
            ScaleType.FIT_START -> androidx.camera.view.PreviewView.ScaleType.FIT_START
            ScaleType.FIT_CENTER -> androidx.camera.view.PreviewView.ScaleType.FIT_CENTER
            ScaleType.FIT_END -> androidx.camera.view.PreviewView.ScaleType.FIT_END
        }
    }

    object Factory : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
        private val views = mutableMapOf<Int, PreviewView>()

        override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
            return views[viewId] ?: PreviewView(context, viewId, args)
        }

        fun addView(viewId: Int, view: PreviewView) {
            views[viewId] = view
        }

        fun retrieveView(viewId: Int): PreviewView? {
            return views[viewId]
        }

        fun removeView(viewId: Int): PreviewView? {
            return views.remove(viewId)
        }
    }

    enum class ScaleType {
        FILL_START, FILL_CENTER, FILL_END, FIT_START, FIT_CENTER, FIT_END,
    }
}