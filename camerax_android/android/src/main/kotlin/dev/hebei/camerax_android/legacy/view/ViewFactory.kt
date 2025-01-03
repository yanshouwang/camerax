package dev.hebei.camerax_android.legacy.view

import android.content.Context
import android.view.View
import dev.hebei.camerax_android.legacy.CameraXPigeonInstanceManager
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class ViewFactory(private val instanceManager: CameraXPigeonInstanceManager) :
    PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
        val identifier = when (args) {
            is Long -> args
            is Int -> args.toLong()
            else -> throw IllegalArgumentException("Illegal args: $args")
        }
        val view = instanceManager.getInstance<Any>(identifier)
        if (view is PlatformView) {
            return view
        } else if (view is View) {
            return object : PlatformView {
                override fun getView(): View {
                    return view
                }

                override fun dispose() {
                }
            }
        }
        throw IllegalStateException("Unable to find a PlatformView or View instance: $args, $view")
    }
}