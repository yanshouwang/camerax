package dev.zeekr.camerax_android.video

import android.location.Location
import androidx.camera.video.OutputOptions
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiOutputOptionsApi

class OutputOptionsImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiOutputOptionsApi(registrar) {
    override fun getDurationLimitMillis(pigeon_instance: OutputOptions): Long {
        return pigeon_instance.durationLimitMillis
    }

    override fun getFileSizeLimit(pigeon_instance: OutputOptions): Long {
        return pigeon_instance.fileSizeLimit
    }

    override fun getLocation(pigeon_instance: OutputOptions): Location? {
        return pigeon_instance.location
    }
}