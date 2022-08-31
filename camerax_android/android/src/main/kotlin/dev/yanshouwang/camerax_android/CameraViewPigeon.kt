package dev.yanshouwang.camerax_android

import android.app.Activity
import androidx.camera.view.LifecycleCameraController
import androidx.camera.view.PreviewView

internal class CameraViewPigeon : Pigeons.CameraViewHostPigeon {
    var activity: Activity? = null

    override fun create(id: String, controllerId: String, scaleTypeNumber: Long) {
        var view = InstanceManager.findInstance<CameraView>(id)
        if (view == null) {
            view = CameraView(activity!!)
            InstanceManager.add(id, view)
        }
        view.controller =
            InstanceManager.findInstance<LifecycleCameraController>(controllerId) ?: throw IllegalArgumentException()
        view.scaleType = PreviewView.ScaleType.values().first { it.ordinal == scaleTypeNumber.toInt() }
    }

    override fun setScaleType(id: String, number: Long) {
        val view = InstanceManager.findInstance<CameraView>(id) ?: throw IllegalArgumentException()
        view.scaleType = PreviewView.ScaleType.values().first { it.ordinal == number.toInt() }
    }
}