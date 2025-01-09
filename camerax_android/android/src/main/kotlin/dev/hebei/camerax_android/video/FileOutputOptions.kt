package dev.hebei.camerax_android.video

import android.location.Location
import androidx.annotation.IntRange
import java.io.File

class FileOutputOptions internal constructor(override val obj: androidx.camera.video.FileOutputOptions) :
    OutputOptions(obj) {
    class Builder {
        internal constructor(obj: androidx.camera.video.FileOutputOptions.Builder) {
            this.obj = obj
        }

        constructor(file: File) {
            this.obj = androidx.camera.video.FileOutputOptions.Builder(file)
        }

        internal val obj: androidx.camera.video.FileOutputOptions.Builder

        fun setDurationLimitMillis(@IntRange(from = 0L) durationLimitMillis: Long): Builder {
            val obj = this.obj.setDurationLimitMillis(durationLimitMillis)
            return Builder(obj)
        }

        fun setFileSizeLimit(@IntRange(from = 0L) fileSizeLimitBytes: Long): Builder {
            val obj = this.obj.setFileSizeLimit(fileSizeLimitBytes)
            return Builder(obj)
        }

        fun setLocation(location: Location?): Builder {
            val obj = this.obj.setLocation(location)
            return Builder(obj)
        }

        fun build(): FileOutputOptions {
            val obj = this.obj.build()
            return FileOutputOptions(obj)
        }
    }
}