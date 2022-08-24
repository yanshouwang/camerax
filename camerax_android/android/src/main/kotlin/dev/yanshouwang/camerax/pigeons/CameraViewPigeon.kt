package dev.yanshouwang.camerax.pigeons

import android.app.Activity
import androidx.camera.view.LifecycleCameraController
import androidx.camera.view.PreviewView
import dev.yanshouwang.camerax.CameraView
import dev.yanshouwang.camerax.InstanceManager
import dev.yanshouwang.camerax.messages.CameraViewArguments

internal class CameraViewPigeon : Pigeons.CameraViewHostPigeon {
    var activity: Activity? = null

    override fun createOrSetArguments(id: String, argumentsBuffer: ByteArray) {
        var view = InstanceManager.findInstance<CameraView>(id)
        if (view == null) {
            view = CameraView(activity!!)
            InstanceManager.add(id, view)
        }
        val arguments = CameraViewArguments.parseFrom(argumentsBuffer)
        val controller = InstanceManager.findInstance<LifecycleCameraController>(arguments.controllerId)
            ?: throw IllegalArgumentException()
        val scaleType = PreviewView.ScaleType.values().first { it.ordinal == arguments.scaleType.ordinal }
        view.controller = controller
        view.scaleType = scaleType
    }
}