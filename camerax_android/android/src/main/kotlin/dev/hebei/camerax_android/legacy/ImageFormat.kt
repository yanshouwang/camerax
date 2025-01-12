package dev.hebei.camerax_android.legacy

val Int.imageFormatArgs
    get() = when (this) {
        android.graphics.ImageFormat.JPEG -> ImageFormat.JPEG
        android.graphics.ImageFormat.JPEG_R -> ImageFormat.JPEG_R
        android.graphics.ImageFormat.YUV_420_888 -> ImageFormat.YUV420_888
        android.graphics.PixelFormat.RGBA_8888 -> ImageFormat.RGBA8888
        else -> throw IllegalArgumentException()
    }