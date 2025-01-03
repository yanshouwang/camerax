package dev.hebei.camerax_android.legacy

import android.app.Activity
import android.content.Context
import dev.hebei.camerax_android.legacy.core.CameraSelector
import dev.hebei.camerax_android.legacy.core.PermissionManager
import dev.hebei.camerax_android.legacy.view.CameraController
import dev.hebei.camerax_android.legacy.view.LifecycleCameraController
import dev.hebei.camerax_android.legacy.view.PreviewView
import io.flutter.plugin.common.BinaryMessenger

class CameraXRegistrar(val context: Context, messenger: BinaryMessenger) :
    CameraXPigeonProxyApiRegistrar(messenger) {
    var activity: Activity? = null
    
    override fun getPigeonApiPermissionManager(): PigeonApiPermissionManager {
        return PermissionManager(this)
    }

    override fun getPigeonApiCameraSelector(): PigeonApiCameraSelector {
        return CameraSelector(this)
    }

    override fun getPigeonApiCameraController(): PigeonApiCameraController {
        return CameraController(this)
    }

    override fun getPigeonApiLifecycleCameraController(): PigeonApiLifecycleCameraController {
        return LifecycleCameraController(this)
    }

    override fun getPigeonApiPreviewView(): PigeonApiPreviewView {
        return PreviewView(this)
    }
}