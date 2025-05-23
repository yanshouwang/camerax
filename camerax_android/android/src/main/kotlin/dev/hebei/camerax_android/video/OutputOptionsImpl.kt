package dev.hebei.camerax_android.video

import android.location.Location
import androidx.camera.video.OutputOptions
import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.PigeonApiOutputOptionsApi

class OutputOptionsImpl(impl: CameraXImpl): PigeonApiOutputOptionsApi(impl) {
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