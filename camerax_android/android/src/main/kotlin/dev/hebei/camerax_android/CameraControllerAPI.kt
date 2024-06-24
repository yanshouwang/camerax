package dev.hebei.camerax_android

import android.app.Activity
import android.content.Context
import androidx.camera.view.CameraController
import androidx.camera.view.LifecycleCameraController
import androidx.core.content.ContextCompat
import androidx.lifecycle.LifecycleOwner

class CameraControllerAPI(private val context: Context, private val instanceManager: InstanceManager) : CameraControllerHostAPI {
    var activity: Activity? = null

    override fun create(identifier: Long) {
        val controller = LifecycleCameraController(context)
        instanceManager.addDartCreatedInstance(controller, identifier)
    }

    override fun bindToLifecycle(identifier: Long) {
        val controller = instanceManager.getInstance<LifecycleCameraController>(identifier) ?: throw IllegalArgumentException()
        val lifecycleOwner = activity as LifecycleOwner
        controller.bindToLifecycle(lifecycleOwner)
    }

    override fun unbind(identifier: Long) {
        val controller = instanceManager.getInstance<LifecycleCameraController>(identifier) ?: throw IllegalArgumentException()
        controller.unbind()
    }

    override fun hasCamera(identifier: Long, cameraSelectorArgs: CameraSelectorArgs): Boolean {
        val controller = instanceManager.getInstance<LifecycleCameraController>(identifier) ?: throw IllegalArgumentException()
        val cameraSelector = cameraSelectorArgs.toObject()
        return controller.hasCamera(cameraSelector)
    }

    override fun setCameraSelector(identifier: Long, cameraSelectorArgs: CameraSelectorArgs) {
        val controller = instanceManager.getInstance<CameraController>(identifier) ?: throw IllegalArgumentException()
        controller.cameraSelector = cameraSelectorArgs.toObject()
    }

    override fun isTapToFocusEnabled(identifier: Long): Boolean {
        val controller = instanceManager.getInstance<LifecycleCameraController>(identifier) ?: throw IllegalArgumentException()
        return controller.isTapToFocusEnabled
    }

    override fun setTapToFocusEnabled(identifier: Long, enabledArgs: Boolean) {
        val controller = instanceManager.getInstance<LifecycleCameraController>(identifier) ?: throw IllegalArgumentException()
        controller.isTapToFocusEnabled = enabledArgs
    }

    override fun getZoomState(identifier: Long): ZoomStateArgs? {
        val controller = instanceManager.getInstance<LifecycleCameraController>(identifier) ?: throw IllegalArgumentException()
        val zoomState = controller.zoomState.value
        return zoomState?.toArgs()
    }

    override fun isPinchToZoomEnabled(identifier: Long): Boolean {
        val controller = instanceManager.getInstance<LifecycleCameraController>(identifier) ?: throw IllegalArgumentException()
        return controller.isPinchToZoomEnabled
    }

    override fun setPinchToZoomEnabled(identifier: Long, enabledArgs: Boolean) {
        val controller = instanceManager.getInstance<LifecycleCameraController>(identifier) ?: throw IllegalArgumentException()
        controller.isPinchToZoomEnabled = enabledArgs
    }

    override fun setLinearZoom(identifier: Long, linearZoomArgs: Double, callback: (Result<Unit>) -> Unit) {
        val controller = instanceManager.getInstance<LifecycleCameraController>(identifier) ?: throw IllegalArgumentException()
        val linearZoom = linearZoomArgs.toFloat()
        controller.setLinearZoom(linearZoom).run {
            val listener = {
                val result = this.runCatching { this.get().run { } }
                callback(result)
            }
            val executor = ContextCompat.getMainExecutor(context)
            this.addListener(listener, executor)
        }
    }

    override fun setZoomRatio(identifier: Long, zoomRatioArgs: Double, callback: (Result<Unit>) -> Unit) {
        val controller = instanceManager.getInstance<LifecycleCameraController>(identifier) ?: throw IllegalArgumentException()
        val zoomRatio = zoomRatioArgs.toFloat()
        controller.setZoomRatio(zoomRatio).run {
            val listener = {
                val result = this.runCatching { this.get().run { } }
                callback(result)
            }
            val executor = ContextCompat.getMainExecutor(context)
            this.addListener(listener, executor)
        }
    }
}