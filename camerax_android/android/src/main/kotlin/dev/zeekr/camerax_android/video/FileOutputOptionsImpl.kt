package dev.zeekr.camerax_android.video

import android.location.Location
import androidx.camera.video.FileOutputOptions
import dev.zeekr.camerax_android.CameraXImpl
import dev.zeekr.camerax_android.PigeonApiFileOutputOptionsApi
import dev.zeekr.camerax_android.common.api
import dev.zeekr.camerax_android.common.fileImpl

class FileOutputOptionsImpl(impl: CameraXImpl) : PigeonApiFileOutputOptionsApi(impl) {
    override fun build(
        file: String, durationLimitMillis: Long?, fileSizeLimitBytes: Long?, location: Location?
    ): FileOutputOptions {
        val builder = FileOutputOptions.Builder(file.fileImpl).setLocation(location)
        if (durationLimitMillis != null) {
            builder.setDurationLimitMillis(durationLimitMillis)
        }
        if (fileSizeLimitBytes != null) {
            builder.setFileSizeLimit(fileSizeLimitBytes)
        }
        return builder.build()
    }

    override fun getFile(pigeon_instance: FileOutputOptions): String {
        return pigeon_instance.file.api
    }
}