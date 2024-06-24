package dev.hebei.camerax_android

import android.content.Context
import androidx.camera.view.CameraController
import androidx.camera.view.PreviewView

class PreviewViewAPI(private val context: Context, private val instanceManager: InstanceManager) : PreviewViewHostAPI {
    override fun create(identifier: Long) {
        val view = PreviewView(context)
        instanceManager.addDartCreatedInstance(view, identifier)
    }

    override fun setController(identifier: Long, controllerIdentifier: Long) {
        val view = instanceManager.getInstance<PreviewView>(identifier) ?: throw IllegalArgumentException()
        val controller = instanceManager.getInstance<CameraController>(controllerIdentifier) ?: throw IllegalArgumentException()
        view.controller = controller
    }

    override fun setScaleType(identifier: Long, scaleTypeArgs: ScaleTypeArgs) {
        val view = instanceManager.getInstance<PreviewView>(identifier) ?: throw IllegalArgumentException()
        view.scaleType = scaleTypeArgs.toObject()
    }
}