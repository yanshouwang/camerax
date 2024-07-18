package dev.hebei.camerax_android

import android.content.Context
import android.view.View
import androidx.annotation.Keep
import androidx.camera.view.PreviewView
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

object PreviewViewFactory : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    private val views = mutableMapOf<Int, PreviewView>()

    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
        return object : PlatformView {
            override fun getView(): View {
                return views.getOrPut(viewId) {
                    PreviewView(context)
                }
            }

            override fun dispose() {
                views.remove(viewId)
            }
        }
    }

    @Keep
    fun retrieveView(viewId: Int): PreviewView? {
        return views[viewId]
    }
}