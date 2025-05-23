package dev.hebei.camerax_android.common

import android.graphics.Bitmap
import java.io.ByteArrayOutputStream

val Bitmap.api: ByteArray
    get() {
        val stream = ByteArrayOutputStream()
        compress(Bitmap.CompressFormat.JPEG, 100, stream)
        return stream.toByteArray()
    }