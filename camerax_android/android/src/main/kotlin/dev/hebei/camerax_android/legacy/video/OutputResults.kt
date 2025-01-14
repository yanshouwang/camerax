package dev.hebei.camerax_android.legacy.video

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiOutputResults
import dev.hebei.camerax_android.legacy.common.args

class OutputResults(registrar: CameraXRegistrar) : PigeonApiOutputResults(registrar) {
    override fun outputUri(pigeon_instance: androidx.camera.video.OutputResults): String? {
        return pigeon_instance.outputUri.args
    }
}