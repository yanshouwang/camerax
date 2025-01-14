package dev.hebei.camerax_android.legacy.common

val android.graphics.Bitmap.args: ByteArray
    get() {
        val stream = java.io.ByteArrayOutputStream()
        compress(android.graphics.Bitmap.CompressFormat.JPEG, 100, stream)
        return stream.toByteArray()
    }