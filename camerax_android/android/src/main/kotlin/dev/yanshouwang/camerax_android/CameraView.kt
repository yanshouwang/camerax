package dev.yanshouwang.camerax_android

import android.content.Context
import android.view.View
import io.flutter.plugin.platform.PlatformView
import androidx.camera.view.PreviewView

internal class CameraView(context: Context) : PlatformView {
    private val view: PreviewView

    init {
        view = PreviewView(context)
    }

    var controller
        get() = view.controller
        set(value) {
            view.controller = value
        }
    var scaleType
        get() = view.scaleType
        set(value) {
            view.scaleType = value
        }

    override fun getView(): View {
        return view
    }

    override fun dispose() {}
}