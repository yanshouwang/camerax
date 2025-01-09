package dev.hebei.camerax_android.video

import androidx.annotation.IntRange

abstract class OutputOptions internal constructor(internal open val obj: androidx.camera.video.OutputOptions) {
    val durationLimitMillis @IntRange(from = 0L) get() = obj.durationLimitMillis
    val fileSizeLimit @IntRange(from = 0) get() = obj.fileSizeLimit
}