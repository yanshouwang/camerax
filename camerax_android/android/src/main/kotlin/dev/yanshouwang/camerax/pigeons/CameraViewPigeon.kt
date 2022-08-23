package dev.yanshouwang.camerax.pigeons

import android.app.Activity
import androidx.camera.view.LifecycleCameraController as MyCameraController
import androidx.camera.view.PreviewView as MyCameraView
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
        val myController =
            InstanceManager.findInstance<MyCameraController>(arguments.controllerId)
                ?: throw IllegalArgumentException()
        val myScaleType = MyCameraView.ScaleType.values().first { scaleType ->
            scaleType.ordinal == arguments.scaleType.ordinal
        }
        view.controller = myController
        view.scaleType = myScaleType
    }
}