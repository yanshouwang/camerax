package dev.hebei.camerax_android

import android.content.ContentResolver
import android.content.ContentValues
import android.net.Uri
import androidx.camera.video.MediaStoreOutputOptions

class MyMediaStoreOutputOptions {
    class Builder(contentResolver: ContentResolver, collectionUri: Uri) {
        private val builder = MediaStoreOutputOptions.Builder(contentResolver, collectionUri)

        fun setContentValues(contentValues: ContentValues): Builder {
            builder.setContentValues(contentValues)
            return this
        }

        fun build(): MediaStoreOutputOptions {
            return builder.build()
        }
    }
}