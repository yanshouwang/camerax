package dev.yanshouwang.camerax

import android.content.Context
import android.view.View
import io.flutter.plugin.platform.PlatformView
import androidx.camera.view.PreviewView as MyCameraView

internal class CameraView(context: Context) : PlatformView {
    private val myView: MyCameraView

    init {
        myView = MyCameraView(context)
    }

    val surfaceProvider get() = myView.surfaceProvider
    var controller
        get() = myView.controller
        set(value) {
            myView.controller = value
        }
    var scaleType
        get() = myView.scaleType
        set(value) {
            myView.scaleType = value
        }

    override fun getView(): View {
        return myView
    }

    override fun dispose() {
    }
}