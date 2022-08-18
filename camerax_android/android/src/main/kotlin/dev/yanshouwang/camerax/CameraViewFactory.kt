package dev.yanshouwang.camerax

import android.content.Context
import dev.yanshouwang.camerax.messages.CameraViewArguments
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

internal class CameraViewFactory : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    val views = mutableMapOf<Int, CameraView>()

    override fun create(context: Context?, viewId: Int, args: Any?): PlatformView {
        val arguments = CameraViewArguments.parseFrom(args as ByteArray)
        val view = CameraView(context!!, arguments)
        views[viewId] = view
        return view
    }
}