package dev.yanshouwang.camerax

import android.content.Context
import android.view.View
import androidx.camera.view.PreviewView
import dev.yanshouwang.camerax.messages.CameraViewArguments
import io.flutter.plugin.platform.PlatformView

internal class CameraView(context: Context, arguments: CameraViewArguments) : PlatformView {
    private val view: PreviewView

    val surfaceProvider get() = view.surfaceProvider

    init {
        view = PreviewView(context).apply {
            this.scaleType = PreviewView.ScaleType.values().first { scaleType ->
                scaleType.ordinal == arguments.scaleType.ordinal
            }
        }
    }

    override fun getView(): View {
        return view
    }

    override fun dispose() {
    }
}