package dev.zeekr.camerax_android.common

import android.graphics.ImageFormat
import android.graphics.PixelFormat
import dev.zeekr.camerax_android.ImageFormatApi

val Int.imageFormatApi
    get() = when (this) {
        ImageFormat.YUV_420_888 -> ImageFormatApi.YUV420_888
        ImageFormat.JPEG -> ImageFormatApi.JPEG
        PixelFormat.RGBA_8888 -> ImageFormatApi.RGBA8888
        else -> throw IllegalArgumentException()
    }