package dev.yanshouwang.camerax

import android.app.Activity
import dev.yanshouwang.camerax.messages.CameraViewArguments

internal class CameraViewPigeon : Pigeons.CameraViewHostPigeon {
    var activity: Activity? = null

    override fun create(id: String, argumentsByteArray: ByteArray) {
        val arguments = CameraViewArguments.parseFrom(argumentsByteArray);
        val scaleType = arguments.scaleType
        var view = InstanceManager.findInstance<CameraView>(id)
        if (view == null) {
            val activity = activity!!
            view = CameraView(activity).apply {
                this.scaleType = scaleType
            }
            InstanceManager.add(id, view)
        } else {
            view.scaleType = scaleType
        }
    }

    override fun dispose(id: String) {
        InstanceManager.removeById(id)
    }
}