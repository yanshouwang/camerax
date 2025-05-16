package dev.hebei.camerax_android.video

import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.PigeonApiFileOutputOptionsApi
import dev.hebei.camerax_android.common.api
import dev.hebei.camerax_android.common.fileImpl

class FileOutputOptionsImpl(impl: CameraXImpl) : PigeonApiFileOutputOptionsApi(impl) {
    override fun build(
        file: String, durationLimitMillis: Long?, fileSizeLimitBytes: Long?, location: android.location.Location?
    ): androidx.camera.video.FileOutputOptions {
        val builder = androidx.camera.video.FileOutputOptions.Builder(file.fileImpl).setLocation(location)
        if (durationLimitMillis != null) {
            builder.setDurationLimitMillis(durationLimitMillis)
        }
        if (fileSizeLimitBytes != null) {
            builder.setFileSizeLimit(fileSizeLimitBytes)
        }
        return builder.build()
    }

    override fun file(pigeon_instance: androidx.camera.video.FileOutputOptions): String {
        return pigeon_instance.file.api
    }
}