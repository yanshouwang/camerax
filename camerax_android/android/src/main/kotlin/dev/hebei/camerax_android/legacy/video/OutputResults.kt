package dev.hebei.camerax_android.legacy.video

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiVideoOutputResults

class OutputResults(registrar: CameraXRegistrar) : PigeonApiVideoOutputResults(registrar) {
    override fun getOutputUri(pigeon_instance: androidx.camera.video.OutputResults): android.net.Uri {
        return pigeon_instance.outputUri
    }
}