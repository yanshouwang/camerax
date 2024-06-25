package dev.hebei.camerax_android

import android.content.Context
import android.view.View
import androidx.annotation.Keep
import androidx.camera.view.PreviewView
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

object PreviewViewFactory : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    private val views = mutableMapOf<Int, PreviewView>()
    private var binding: ActivityPluginBinding? = null
    private val activity get() = binding?.activity ?: throw IllegalStateException()

    override fun create(context: Context?, viewId: Int, args: Any?): PlatformView {
        return object : PlatformView {
            override fun getView(): View {
                return views.getOrPut(viewId) {
                    PreviewView(activity)
                }
            }

            override fun dispose() {
                views.remove(viewId)
            }
        }
    }

    internal fun updateActivity(binding: ActivityPluginBinding?) {
        this.binding = binding
    }

    @Keep
    fun retrieveView(viewId: Int): PreviewView? {
        return views[viewId]
    }
}