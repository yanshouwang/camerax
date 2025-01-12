package dev.hebei.camerax_android.core

enum class ImageFormat {
    JPEG, JPEG_R, YUV_420_888, RGBA_8888,
}

val Int.imageFormatArgs
    get() = when (this) {
        android.graphics.ImageFormat.JPEG -> ImageFormat.JPEG
        android.graphics.ImageFormat.JPEG_R -> ImageFormat.JPEG_R
        android.graphics.ImageFormat.YUV_420_888 -> ImageFormat.YUV_420_888
        android.graphics.ImageFormat.FLEX_RGBA_8888 -> ImageFormat.RGBA_8888
        else -> throw IllegalArgumentException()
    }