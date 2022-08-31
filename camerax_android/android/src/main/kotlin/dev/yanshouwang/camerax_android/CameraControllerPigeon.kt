package dev.yanshouwang.camerax_android

import android.app.Activity
import android.content.Context
import androidx.camera.core.CameraSelector
import androidx.camera.core.ImageAnalysis
import androidx.camera.core.TorchState
import androidx.camera.view.LifecycleCameraController
import androidx.lifecycle.LifecycleOwner
import androidx.lifecycle.Observer
import io.flutter.plugin.common.BinaryMessenger
import java.util.concurrent.Executors
import dev.yanshouwang.camerax_android.models.proto.CameraSelector as MyCameraSelector

internal class CameraControllerPigeon : Pigeons.CameraControllerHostPigeon {
    lateinit var context: Context
    lateinit var binaryMessenger: BinaryMessenger

    var activity: Activity? = null

    private val flutter by lazy { Pigeons.CameraControllerFlutterPigeion(binaryMessenger) }
    private val executor by lazy { Executors.newSingleThreadExecutor() }

    override fun create(id: String, cameraSelectorBuffer: ByteArray) {
        val controller = LifecycleCameraController(context).apply {
            val myCameraSelector = MyCameraSelector.parseFrom(cameraSelectorBuffer)
            this.cameraSelector = when (myCameraSelector.facingNumber) {
                CameraSelector.LENS_FACING_FRONT -> CameraSelector.DEFAULT_FRONT_CAMERA
                CameraSelector.LENS_FACING_BACK -> CameraSelector.DEFAULT_BACK_CAMERA
                else -> throw IllegalArgumentException()
            }
            val owner = activity as LifecycleOwner
            val observer = Observer<Int> {
                val state = it == TorchState.ON
                flutter.onTorchStateChanged(id, state) {}
            }
            this.torchState.observe(owner, observer)
            InstanceManager.add("$id/torch_state/observer", observer)
        }
        InstanceManager.add(id, controller)
    }

    override fun bind(id: String) {
        val controller = InstanceManager.findInstance<LifecycleCameraController>(id) ?: throw IllegalArgumentException()
        val owner = activity as LifecycleOwner
        controller.bindToLifecycle(owner)
    }

    override fun enableTorch(id: String, state: Boolean) {
        val controller = InstanceManager.findInstance<LifecycleCameraController>(id) ?: throw IllegalArgumentException()
        controller.enableTorch(state)
    }

    override fun setCameraSelector(id: String, cameraSelectorBuffer: ByteArray) {
        val controller = InstanceManager.findInstance<LifecycleCameraController>(id) ?: throw IllegalArgumentException()
        val myCameraSelector = MyCameraSelector.parseFrom(cameraSelectorBuffer)
        controller.cameraSelector = when (myCameraSelector.facingNumber) {
            CameraSelector.LENS_FACING_FRONT -> CameraSelector.DEFAULT_FRONT_CAMERA
            CameraSelector.LENS_FACING_BACK -> CameraSelector.DEFAULT_BACK_CAMERA
            else -> throw IllegalArgumentException()
        }
    }

    override fun setImageAnalyzer(id: String, imageAnalyzerId: String) {
        val controller = InstanceManager.findInstance<LifecycleCameraController>(id) ?: throw IllegalArgumentException()
        val analyzer =
            InstanceManager.findInstance<ImageAnalysis.Analyzer>(imageAnalyzerId) ?: throw IllegalArgumentException()
        controller.setImageAnalysisAnalyzer(executor, analyzer)
    }

    override fun clearImageAnalyzer(id: String) {
        val controller = InstanceManager.findInstance<LifecycleCameraController>(id) ?: throw IllegalArgumentException()
        controller.clearImageAnalysisAnalyzer()
    }

    override fun unbind(id: String) {
        val controller = InstanceManager.findInstance<LifecycleCameraController>(id) ?: throw IllegalArgumentException()
        controller.unbind()
    }

    override fun dispose(id: String) {
        val controller = InstanceManager.removeById<LifecycleCameraController>(id) ?: throw IllegalArgumentException()
        val observer =
            InstanceManager.removeById<Observer<Int>>("$id/torch_state/observer") ?: throw IllegalArgumentException()
        controller.torchState.removeObserver(observer)
        controller.unbind()
    }
}