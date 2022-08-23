package dev.yanshouwang.camerax.pigeons

import android.app.Activity
import android.content.Context
import androidx.lifecycle.LifecycleOwner
import androidx.lifecycle.Observer
import androidx.camera.core.CameraSelector as MyCameraSelector
import androidx.camera.core.ImageAnalysis as MyImageAnalysis
import androidx.camera.core.TorchState as MyTorchState
import androidx.camera.view.LifecycleCameraController as MyCameraController
import dev.yanshouwang.camerax.InstanceManager
import dev.yanshouwang.camerax.messages.CameraFacing
import dev.yanshouwang.camerax.messages.CameraSelector
import io.flutter.plugin.common.BinaryMessenger
import java.util.concurrent.Executor

internal class CameraControllerPigeon(private val executor: Executor) :
    Pigeons.CameraControllerHostPigeon {
    lateinit var binaryMessenger: BinaryMessenger
    var activity: Activity? = null

    private val flutter by lazy { Pigeons.CameraControllerFlutterPigeion(binaryMessenger) }

    override fun create(id: String, cameraSelectorBuffer: ByteArray) {
        val context = activity as Context
        val myCameraController = MyCameraController(context).apply {
            val cameraSelector = CameraSelector.parseFrom(cameraSelectorBuffer)
            this.cameraSelector = when (cameraSelector.facing) {
                CameraFacing.CAMERA_FACING_BACK -> MyCameraSelector.DEFAULT_BACK_CAMERA
                CameraFacing.CAMERA_FACING_FRONT -> MyCameraSelector.DEFAULT_FRONT_CAMERA
                else -> throw IllegalArgumentException()
            }
            val owner = activity as LifecycleOwner
            val observer = Observer<Int> { value ->
                val state = value == MyTorchState.ON
                flutter.onTorchStateChanged(id, state) {}
            }
            this.torchState.observe(owner, observer)
            InstanceManager.add("$id-torchState-observer", observer)
        }
        InstanceManager.add(id, myCameraController)
    }

    override fun bind(id: String) {
        val myCameraController = InstanceManager.findInstance<MyCameraController>(id)
            ?: throw  IllegalArgumentException()
        val owner = activity as LifecycleOwner
        myCameraController.bindToLifecycle(owner)
    }

    override fun enableTorch(id: String, state: Boolean) {
        val myCameraController = InstanceManager.findInstance<MyCameraController>(id)
            ?: throw  IllegalArgumentException()
        myCameraController.enableTorch(state)
    }

    override fun setCameraSelector(id: String, cameraSelectorBuffer: ByteArray) {
        val myCameraController = InstanceManager.findInstance<MyCameraController>(id)
            ?: throw  IllegalArgumentException()
        val cameraSelector = CameraSelector.parseFrom(cameraSelectorBuffer)
        myCameraController.cameraSelector = when (cameraSelector.facing) {
            CameraFacing.CAMERA_FACING_BACK -> MyCameraSelector.DEFAULT_BACK_CAMERA
            CameraFacing.CAMERA_FACING_FRONT -> MyCameraSelector.DEFAULT_FRONT_CAMERA
            else -> throw IllegalArgumentException()
        }
    }

    override fun setImageAnalyzer(id: String, imageAnalyzerId: String) {
        val myCameraController = InstanceManager.findInstance<MyCameraController>(id)
            ?: throw  IllegalArgumentException()
        val myImageAnalyzer =
            InstanceManager.findInstance<MyImageAnalysis.Analyzer>(imageAnalyzerId)
                ?: throw  IllegalArgumentException()
        myCameraController.setImageAnalysisAnalyzer(executor, myImageAnalyzer)
    }

    override fun clearImageAnalyzer(id: String) {
        val myCameraController = InstanceManager.findInstance<MyCameraController>(id)
            ?: throw  IllegalArgumentException()
        myCameraController.clearImageAnalysisAnalyzer()
    }

    override fun unbind(id: String) {
        val myCameraController = InstanceManager.findInstance<MyCameraController>(id)
            ?: throw  IllegalArgumentException()
        myCameraController.unbind()
    }

    override fun dispose(id: String) {
        val myCameraController =
            InstanceManager.removeById<MyCameraController>(id) ?: throw IllegalArgumentException()
        val observer = InstanceManager.removeById<Observer<Int>>("$id-torchState-observer")
            ?: throw  IllegalArgumentException()
        myCameraController.torchState.removeObserver(observer)
        myCameraController.unbind()
    }
}