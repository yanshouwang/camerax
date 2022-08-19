package dev.yanshouwang.camerax

import android.content.Context
import android.view.View
import androidx.camera.view.PreviewView
import dev.yanshouwang.camerax.messages.ScaleType
import io.flutter.plugin.platform.PlatformView

internal class CameraView(context: Context) : PlatformView {
    private val view: PreviewView

    init {
        view = PreviewView(context)
    }

    val surfaceProvider get() = view.surfaceProvider
    var scaleType: ScaleType
        get() = ScaleType.forNumber(view.scaleType.ordinal)
        set(value) {
            view.scaleType = PreviewView.ScaleType.values().first { scaleType ->
                scaleType.ordinal == value.ordinal
            }
        }

    override fun getView(): View {
        return view
    }

    override fun dispose() {
    }
}