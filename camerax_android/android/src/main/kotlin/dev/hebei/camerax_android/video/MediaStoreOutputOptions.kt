package dev.hebei.camerax_android.video

import android.content.ContentResolver
import android.content.ContentValues
import android.location.Location
import android.net.Uri
import androidx.annotation.IntRange

class MediaStoreOutputOptions internal constructor(override val obj: androidx.camera.video.MediaStoreOutputOptions) :
    OutputOptions(obj) {
    companion object {
        val EMPTY_CONTENT_VALUES get() = androidx.camera.video.MediaStoreOutputOptions.EMPTY_CONTENT_VALUES
    }

    val collectionUri get() = obj.collectionUri
    val contentResolver get() = obj.contentResolver
    val contentValues get() = obj.contentValues

    class Builder {
        internal constructor(obj: androidx.camera.video.MediaStoreOutputOptions.Builder) {
            this.obj = obj
        }

        constructor(contentResolver: ContentResolver, collectionUri: Uri) {
            this.obj = androidx.camera.video.MediaStoreOutputOptions.Builder(
                contentResolver, collectionUri
            )
        }

        internal val obj: androidx.camera.video.MediaStoreOutputOptions.Builder

        fun setContentValues(contentValues: ContentValues): Builder {
            val obj = this.obj.setContentValues(contentValues)
            return Builder(obj)
        }

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

        fun build(): MediaStoreOutputOptions {
            val obj = this.obj.build()
            return MediaStoreOutputOptions(obj)
        }
    }
}