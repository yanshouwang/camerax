package dev.hebei.camerax_android

import android.content.ContentResolver
import android.content.ContentValues
import android.net.Uri
import androidx.annotation.Keep
import androidx.camera.video.MediaStoreOutputOptions

@Keep
class MyMediaStoreOutputOptions {
    class MyBuilder(contentResolver: ContentResolver, collectionUri: Uri) {
        private val builder = MediaStoreOutputOptions.Builder(contentResolver, collectionUri)

        fun setContentValues(contentValues: ContentValues): MyBuilder {
            builder.setContentValues(contentValues)
            return this
        }

        fun build(): MediaStoreOutputOptions {
            return builder.build()
        }
    }
}