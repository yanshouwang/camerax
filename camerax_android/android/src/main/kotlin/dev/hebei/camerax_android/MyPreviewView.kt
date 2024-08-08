package dev.hebei.camerax_android

import android.content.Context
import android.view.View
import androidx.camera.view.PreviewView
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class MyPreviewView(context: Context, private val viewId: Int, args: Any?) : PlatformView {
    private val view = PreviewView(context)

    init {
        MyFactory.addView(viewId, this)
    }

    override fun getView(): View {
        return view
    }

    override fun dispose() {
        MyFactory.removeView(viewId)
    }

    var controller
        get() = view.controller
        set(value) {
            view.controller = value
        }

    var scaleType
        get() = when (view.scaleType) {
            PreviewView.ScaleType.FILL_START -> MyScaleType.FILL_START
            PreviewView.ScaleType.FILL_CENTER -> MyScaleType.FILL_CENTER
            PreviewView.ScaleType.FILL_END -> MyScaleType.FILL_END
            PreviewView.ScaleType.FIT_START -> MyScaleType.FIT_START
            PreviewView.ScaleType.FIT_CENTER -> MyScaleType.FIT_CENTER
            PreviewView.ScaleType.FIT_END -> MyScaleType.FIT_END
        }
        set(value) {
            view.scaleType = when (value) {
                MyScaleType.FILL_START -> PreviewView.ScaleType.FILL_START
                MyScaleType.FILL_CENTER -> PreviewView.ScaleType.FILL_CENTER
                MyScaleType.FILL_END -> PreviewView.ScaleType.FILL_END
                MyScaleType.FIT_START -> PreviewView.ScaleType.FIT_START
                MyScaleType.FIT_CENTER -> PreviewView.ScaleType.FIT_CENTER
                MyScaleType.FIT_END -> PreviewView.ScaleType.FIT_END
            }
        }

    object MyFactory : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
        private val views = mutableMapOf<Int, MyPreviewView>()

        override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
            return views[viewId] ?: MyPreviewView(context, viewId, args)
        }

        fun addView(viewId: Int, view: MyPreviewView) {
            views[viewId] = view
        }

        fun retrieveView(viewId: Int): MyPreviewView? {
            return views[viewId]
        }

        fun removeView(viewId: Int): MyPreviewView? {
            return views.remove(viewId)
        }
    }

    enum class MyScaleType {
        FILL_START, FILL_CENTER, FILL_END, FIT_START, FIT_CENTER, FIT_END,
    }
}