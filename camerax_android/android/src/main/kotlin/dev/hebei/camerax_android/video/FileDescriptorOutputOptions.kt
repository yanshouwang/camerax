package dev.hebei.camerax_android.video

import android.location.Location
import android.os.ParcelFileDescriptor
import androidx.annotation.IntRange

class FileDescriptorOutputOptions internal constructor(override val obj: androidx.camera.video.FileDescriptorOutputOptions) :
    OutputOptions(obj) {
    val parcelFileDescriptor get() = obj.parcelFileDescriptor

    class Builder {
        internal constructor(obj: androidx.camera.video.FileDescriptorOutputOptions.Builder) {
            this.obj = obj
        }

        constructor(fileDescriptor: ParcelFileDescriptor) {
            this.obj = androidx.camera.video.FileDescriptorOutputOptions.Builder(fileDescriptor)
        }

        internal val obj: androidx.camera.video.FileDescriptorOutputOptions.Builder

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

        fun build(): FileDescriptorOutputOptions {
            val obj = this.obj.build()
            return FileDescriptorOutputOptions(obj)
        }
    }
}