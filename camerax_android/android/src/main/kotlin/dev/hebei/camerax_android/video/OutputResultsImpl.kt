package dev.hebei.camerax_android.video

import dev.hebei.camerax_android.CameraXRegistrar
import dev.hebei.camerax_android.PigeonApiOutputResultsApi
import dev.hebei.camerax_android.common.api

class OutputResultsImpl(registrar: CameraXRegistrar) : PigeonApiOutputResultsApi(registrar) {
    override fun outputUri(pigeon_instance: androidx.camera.video.OutputResults): String? {
        return pigeon_instance.outputUri.api
    }
}