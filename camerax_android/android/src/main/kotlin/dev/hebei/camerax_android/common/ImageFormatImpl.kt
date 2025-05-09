package dev.hebei.camerax_android.common

import dev.hebei.camerax_android.ImageFormatApi

val Int.imageFormatApi
    get() = when (this) {
        android.graphics.ImageFormat.JPEG -> ImageFormatApi.JPEG
        android.graphics.ImageFormat.JPEG_R -> ImageFormatApi.JPEG_R
        android.graphics.ImageFormat.YUV_420_888 -> ImageFormatApi.YUV420_888
        android.graphics.PixelFormat.RGBA_8888 -> ImageFormatApi.RGBA8888
        else -> throw IllegalArgumentException()
    }