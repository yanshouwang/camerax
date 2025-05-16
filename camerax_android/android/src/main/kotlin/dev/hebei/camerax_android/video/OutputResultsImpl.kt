package dev.hebei.camerax_android.video

import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.PigeonApiOutputResultsApi
import dev.hebei.camerax_android.common.api

class OutputResultsImpl(impl: CameraXImpl) : PigeonApiOutputResultsApi(impl) {
    override fun outputUri(pigeon_instance: androidx.camera.video.OutputResults): String? {
        return pigeon_instance.outputUri.api
    }
}