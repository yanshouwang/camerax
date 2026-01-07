package dev.zeekr.camerax_android.common

import android.graphics.ImageFormat
import android.graphics.PixelFormat
import android.os.Build
import dev.zeekr.camerax_android.ImageFormatApi

val Int.imageFormatApi: ImageFormatApi
    get() = when (this) {
        ImageFormat.DEPTH16 -> ImageFormatApi.DEPTH16
        ImageFormat.DEPTH_JPEG -> ImageFormatApi.DEPTH_JPEG
        ImageFormat.DEPTH_POINT_CLOUD -> ImageFormatApi.DEPTH_POINT_CLOUD
        ImageFormat.FLEX_RGBA_8888 -> ImageFormatApi.FLEX_RGBA8888
        ImageFormat.FLEX_RGB_888 -> ImageFormatApi.FLEX_RGB888
        ImageFormat.HEIC -> ImageFormatApi.HEIC
        ImageFormat.HEIC_ULTRAHDR -> ImageFormatApi.HEIC_ULTRAHDR
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
        ImageFormat.YCBCR_P010 -> ImageFormatApi.YCBCR_P010
        ImageFormat.YCBCR_P210 -> ImageFormatApi.YCBCR_P210
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

val ImageFormatApi.impl: Int
    get() = when (this) {
        ImageFormatApi.DEPTH16 -> ImageFormat.DEPTH16
        ImageFormatApi.DEPTH_JPEG -> if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            ImageFormat.DEPTH_JPEG
        } else {
            throw UnsupportedOperationException("Field requires API level 29")
        }

        ImageFormatApi.DEPTH_POINT_CLOUD -> ImageFormat.DEPTH_POINT_CLOUD
        ImageFormatApi.FLEX_RGBA8888 -> ImageFormat.FLEX_RGBA_8888
        ImageFormatApi.FLEX_RGB888 -> ImageFormat.FLEX_RGB_888
        ImageFormatApi.HEIC -> if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            ImageFormat.HEIC
        } else {
            throw UnsupportedOperationException("Field requires API level 29")
        }
        ImageFormatApi.HEIC_ULTRAHDR -> if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.BAKLAVA) {
            ImageFormat.HEIC_ULTRAHDR
        } else {
            throw UnsupportedOperationException("Field requires API level 36")
        }

        ImageFormatApi.JPEG -> ImageFormat.JPEG
        ImageFormatApi.JPEG_R -> if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE) {
            ImageFormat.JPEG_R
        } else {
            throw UnsupportedOperationException("Field requires API level 34")
        }

        ImageFormatApi.NV16 -> ImageFormat.NV16
        ImageFormatApi.NV21 -> ImageFormat.NV21
        ImageFormatApi.PRIVATE -> ImageFormat.PRIVATE
        ImageFormatApi.RAW10 -> ImageFormat.RAW10
        ImageFormatApi.RAW12 -> ImageFormat.RAW12
        ImageFormatApi.RAW_PRIVATE -> ImageFormat.RAW_PRIVATE
        ImageFormatApi.RAW_SENSOR -> ImageFormat.RAW_SENSOR
        ImageFormatApi.UNKNOWN -> ImageFormat.UNKNOWN
        ImageFormatApi.Y8 -> if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            ImageFormat.Y8
        } else {
            throw UnsupportedOperationException("Field requires API level 29")
        }

        ImageFormatApi.YCBCR_P010 -> if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            ImageFormat.YCBCR_P010
        } else {
            throw UnsupportedOperationException("Field requires API level 31")
        }

        ImageFormatApi.YCBCR_P210 -> if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.BAKLAVA) {
            ImageFormat.YCBCR_P210
        } else {
            throw UnsupportedOperationException("Field requires API level 36")
        }

        ImageFormatApi.YUV420_888 -> ImageFormat.YUV_420_888
        ImageFormatApi.YUV422_888 -> ImageFormat.YUV_422_888
        ImageFormatApi.YUV444_888 -> ImageFormat.YUV_444_888
        ImageFormatApi.YUY2 -> ImageFormat.YUY2
        ImageFormatApi.YV12 -> ImageFormat.YV12
        ImageFormatApi.A8 -> PixelFormat.A_8
        ImageFormatApi.LA88 -> PixelFormat.LA_88
        ImageFormatApi.L8 -> PixelFormat.L_8
        ImageFormatApi.OPAQUE -> PixelFormat.OPAQUE
        ImageFormatApi.RGBA1010102 -> if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            PixelFormat.RGBA_1010102
        } else {
            throw UnsupportedOperationException("Field requires API level 26")
        }

        ImageFormatApi.RGBA4444 -> PixelFormat.RGBA_4444
        ImageFormatApi.RGBA5551 -> PixelFormat.RGBA_5551
        ImageFormatApi.RGBA8888 -> PixelFormat.RGBA_8888
        ImageFormatApi.RGBA_F16 -> if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            PixelFormat.RGBA_F16
        } else {
            throw UnsupportedOperationException("Field requires API level 26")
        }

        ImageFormatApi.RGBX8888 -> PixelFormat.RGBX_8888
        ImageFormatApi.RGB332 -> PixelFormat.RGB_332
        ImageFormatApi.RGB565 -> PixelFormat.RGB_565
        ImageFormatApi.RGB888 -> PixelFormat.RGB_888
        ImageFormatApi.TRANSLUCENT -> PixelFormat.TRANSLUCENT
        ImageFormatApi.TRANSPARENT -> PixelFormat.TRANSPARENT
    }