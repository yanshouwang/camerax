package dev.zeekr.camerax_android.common

import android.graphics.ImageFormat
import android.graphics.PixelFormat
import dev.zeekr.camerax_android.ImageFormatApi

val Int.imageFormatApi: ImageFormatApi
    get() = when (this) {
        ImageFormat.DEPTH16 -> ImageFormatApi.DEPTH16
        ImageFormat.DEPTH_JPEG -> ImageFormatApi.DEPTH_JPEG
        ImageFormat.DEPTH_POINT_CLOUD -> ImageFormatApi.DEPTH_POINT_CLOUD
        ImageFormat.FLEX_RGBA_8888 -> ImageFormatApi.FLEX_RGBA8888
        ImageFormat.FLEX_RGB_888 -> ImageFormatApi.FLEX_RGB888
        ImageFormat.HEIC -> ImageFormatApi.HEIC
        // TODO: API 36
        // ImageFormat.HEIC_ULTRAHDR -> ImageFormatApi.HEIC_ULTRA_HDR
        ImageFormat.JPEG -> ImageFormatApi.JPEG
        ImageFormat.JPEG_R -> ImageFormatApi.JPEG_R
        ImageFormat.NV16 -> ImageFormatApi.NV16
        ImageFormat.NV21 -> ImageFormatApi.NV21
        ImageFormat.PRIVATE -> ImageFormatApi.PRIVATE
        ImageFormat.RAW10 -> ImageFormatApi.RAW10
        ImageFormat.RAW12 -> ImageFormatApi.RAW12
        ImageFormat.RAW_PRIVATE -> ImageFormatApi.RAW_PRIVATE
        ImageFormat.RAW_SENSOR -> ImageFormatApi.RAW_SENSOR
        // ImageFormat.RGB_565 -> ImageFormatApi.RGB565
        ImageFormat.UNKNOWN -> ImageFormatApi.UNKNOWN
        ImageFormat.Y8 -> ImageFormatApi.Y8
        ImageFormat.YCBCR_P010 -> ImageFormatApi.Y_CB_CR_P010
        // TODO: API 36
        // ImageFormat.YCBCR_P210 -> ImageFormatApi.Y_CB_CR_P210
        ImageFormat.YUV_420_888 -> ImageFormatApi.YUV420_888
        ImageFormat.YUV_422_888 -> ImageFormatApi.YUV422_888
        ImageFormat.YUV_444_888 -> ImageFormatApi.YUV444_888
        ImageFormat.YUY2 -> ImageFormatApi.YUY2
        ImageFormat.YV12 -> ImageFormatApi.YV12
        PixelFormat.A_8 -> ImageFormatApi.A8
        PixelFormat.LA_88 -> ImageFormatApi.LA88
        PixelFormat.L_8 -> ImageFormatApi.L8
        PixelFormat.OPAQUE -> ImageFormatApi.OPAQUE
        PixelFormat.RGBA_1010102 -> ImageFormatApi.RGBA1010102
        PixelFormat.RGBA_4444 -> ImageFormatApi.RGBA4444
        PixelFormat.RGBA_5551 -> ImageFormatApi.RGBA5551
        PixelFormat.RGBA_8888 -> ImageFormatApi.RGBA8888
        PixelFormat.RGBA_F16 -> ImageFormatApi.RGBA_F16
        PixelFormat.RGBX_8888 -> ImageFormatApi.RGBX8888
        PixelFormat.RGB_332 -> ImageFormatApi.RGB332
        PixelFormat.RGB_565 -> ImageFormatApi.RGB565
        PixelFormat.RGB_888 -> ImageFormatApi.RGB888
        PixelFormat.TRANSLUCENT -> ImageFormatApi.TRANSLUCENT
        PixelFormat.TRANSPARENT -> ImageFormatApi.TRANSPARENT
        // PixelFormat.UNKNOWN -> ImageFormatApi.UNKNOWN
        // PixelFormat.YCbCr_420_SP -> ImageFormatApi.Y_CB_CR420SP // NV21
        // PixelFormat.YCbCr_422_I -> ImageFormatApi.Y_CB_CR422I   // YUY2
        // PixelFormat.YCbCr_422_SP -> ImageFormatApi.Y_CB_CR422SP // NV16
        else -> throw NotImplementedError("Not implemented value: $this")
    }