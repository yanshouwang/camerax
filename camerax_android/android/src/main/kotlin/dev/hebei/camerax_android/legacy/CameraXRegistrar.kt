package dev.hebei.camerax_android.legacy

import android.app.Activity
import android.content.Context
import dev.hebei.camerax_android.legacy.core.CameraSelector
import dev.hebei.camerax_android.legacy.core.PermissionManager
import dev.hebei.camerax_android.legacy.core.TorchStateLiveData
import dev.hebei.camerax_android.legacy.core.TorchStateObserver
import dev.hebei.camerax_android.legacy.core.ZoomState
import dev.hebei.camerax_android.legacy.core.ZoomStateLiveData
import dev.hebei.camerax_android.legacy.core.ZoomStateObserver
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

    override fun getPigeonApiTorchStateLiveData(): PigeonApiTorchStateLiveData {
        return TorchStateLiveData(this)
    }

    override fun getPigeonApiTorchStateObserver(): PigeonApiTorchStateObserver {
        return TorchStateObserver(this)
    }

    override fun getPigeonApiZoomState(): PigeonApiZoomState {
        return ZoomState(this)
    }

    override fun getPigeonApiZoomStateLiveData(): PigeonApiZoomStateLiveData {
        return ZoomStateLiveData(this)
    }

    override fun getPigeonApiZoomStateObserver(): PigeonApiZoomStateObserver {
        return ZoomStateObserver(this)
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