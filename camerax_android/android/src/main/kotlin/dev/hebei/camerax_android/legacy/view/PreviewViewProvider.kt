package dev.hebei.camerax_android.legacy.view

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiPreviewViewProvider

class PreviewViewProvider(val registrar: CameraXRegistrar) :
    PigeonApiPreviewViewProvider(registrar) {
    override fun pigeon_defaultConstructor(): dev.hebei.camerax_android.view.PreviewViewProvider {
        val context = registrar.activity ?: registrar.context
        return dev.hebei.camerax_android.view.PreviewViewProvider(context)
    }

    override fun getView(pigeon_instance: dev.hebei.camerax_android.view.PreviewViewProvider): androidx.camera.view.PreviewView {
        val view = pigeon_instance.getView()
        return view.findViewById(dev.hebei.camerax_android.R.id.preview_view)
    }
}