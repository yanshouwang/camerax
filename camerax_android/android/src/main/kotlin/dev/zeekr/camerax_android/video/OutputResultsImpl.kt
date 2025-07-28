package dev.zeekr.camerax_android.video

import androidx.camera.video.OutputResults
import dev.zeekr.camerax_android.CameraXImpl
import dev.zeekr.camerax_android.PigeonApiOutputResultsApi
import dev.zeekr.camerax_android.common.api

class OutputResultsImpl(impl: CameraXImpl) : PigeonApiOutputResultsApi(impl) {
    override fun outputUri(pigeon_instance: OutputResults): String? {
        return pigeon_instance.outputUri.api
    }
}