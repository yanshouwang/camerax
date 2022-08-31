package dev.yanshouwang.camerax_android

import android.content.Context
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

internal object CameraViewFactory : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    const val viewType = "$uri/camera_view"

    override fun create(context: Context?, viewId: Int, args: Any?): PlatformView {
        val id = args as String
        return InstanceManager.findInstance<CameraView>(id) ?: throw IllegalArgumentException()
    }
}