package dev.hebei.camerax_android.legacy.video

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiFileOutputOptions
import dev.hebei.camerax_android.legacy.common.args
import dev.hebei.camerax_android.legacy.common.fileObj

class FileOutputOptions(registrar: CameraXRegistrar) : PigeonApiFileOutputOptions(registrar) {
    override fun build(
        file: String, durationLimitMillis: Long?, fileSizeLimitBytes: Long?, location: android.location.Location?
    ): androidx.camera.video.FileOutputOptions {
        val builder = androidx.camera.video.FileOutputOptions.Builder(file.fileObj).setLocation(location)
        if (durationLimitMillis != null) {
            builder.setDurationLimitMillis(durationLimitMillis)
        }
        if (fileSizeLimitBytes != null) {
            builder.setFileSizeLimit(fileSizeLimitBytes)
        }
        return builder.build()
    }

    override fun file(pigeon_instance: androidx.camera.video.FileOutputOptions): String {
        return pigeon_instance.file.args
    }
}