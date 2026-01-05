package dev.zeekr.camerax_android.common

import android.graphics.ImageFormat
import android.graphics.PixelFormat
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.ImageFormatApi
import dev.zeekr.camerax_android.PigeonApiImageFormatUtilProxyApi
import dev.zeekr.camerax_android.TimeUnitApi

class ImageFormatImpl {
    class UtilImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiImageFormatUtilProxyApi(registrar) {
        override fun fromImageFormat(value: Long): ImageFormatApi {
            return Util.fromImageFormat(value.toInt())
        }

        override fun toImageFormat(api: ImageFormatApi): Long {
            return Util.toImageFormat(api).toLong()
        }
    }

    object Util {
        fun fromImageFormat(value: Int): ImageFormatApi {
            return when (value) {
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
        }

        fun toImageFormat(api: ImageFormatApi): Int {
            return when (api) {
                ImageFormatApi.DEPTH16 -> ImageFormat.DEPTH16
                ImageFormatApi.DEPTH_JPEG -> ImageFormat.DEPTH_JPEG
                ImageFormatApi.DEPTH_POINT_CLOUD -> ImageFormat.DEPTH_POINT_CLOUD
                ImageFormatApi.FLEX_RGBA8888 -> ImageFormat.FLEX_RGBA_8888
                ImageFormatApi.FLEX_RGB888 -> ImageFormat.FLEX_RGB_888
                ImageFormatApi.HEIC -> ImageFormat.HEIC
                ImageFormatApi.HEIC_ULTRAHDR -> ImageFormat.HEIC_ULTRAHDR
                ImageFormatApi.JPEG -> ImageFormat.JPEG
                ImageFormatApi.JPEG_R -> ImageFormat.JPEG_R
                ImageFormatApi.NV16 -> ImageFormat.NV16
                ImageFormatApi.NV21 -> ImageFormat.NV21
                ImageFormatApi.PRIVATE -> ImageFormat.PRIVATE
                ImageFormatApi.RAW10 -> ImageFormat.RAW10
                ImageFormatApi.RAW12 -> ImageFormat.RAW12
                ImageFormatApi.RAW_PRIVATE -> ImageFormat.RAW_PRIVATE
                ImageFormatApi.RAW_SENSOR -> ImageFormat.RAW_SENSOR
                ImageFormatApi.UNKNOWN -> ImageFormat.UNKNOWN
                ImageFormatApi.Y8 -> ImageFormat.Y8
                ImageFormatApi.YCBCR_P010 -> ImageFormat.YCBCR_P010
                ImageFormatApi.YCBCR_P210 -> ImageFormat.YCBCR_P210
                ImageFormatApi.YUV420_888 -> ImageFormat.YUV_420_888
                ImageFormatApi.YUV422_888 -> ImageFormat.YUV_422_888
                ImageFormatApi.YUV444_888 -> ImageFormat.YUV_444_888
                ImageFormatApi.YUY2 -> ImageFormat.YUY2
                ImageFormatApi.YV12 -> ImageFormat.YV12
                ImageFormatApi.A8 -> PixelFormat.A_8
                ImageFormatApi.LA88 -> PixelFormat.LA_88
                ImageFormatApi.L8 -> PixelFormat.L_8
                ImageFormatApi.OPAQUE -> PixelFormat.OPAQUE
                ImageFormatApi.RGBA1010102 -> PixelFormat.RGBA_1010102
                ImageFormatApi.RGBA4444 -> PixelFormat.RGBA_4444
                ImageFormatApi.RGBA5551 -> PixelFormat.RGBA_5551
                ImageFormatApi.RGBA8888 -> PixelFormat.RGBA_8888
                ImageFormatApi.RGBA_F16 -> PixelFormat.RGBA_F16
                ImageFormatApi.RGBX8888 -> PixelFormat.RGBX_8888
                ImageFormatApi.RGB332 -> PixelFormat.RGB_332
                ImageFormatApi.RGB565 -> PixelFormat.RGB_565
                ImageFormatApi.RGB888 -> PixelFormat.RGB_888
                ImageFormatApi.TRANSLUCENT -> PixelFormat.TRANSLUCENT
                ImageFormatApi.TRANSPARENT -> PixelFormat.TRANSPARENT
            }
        }
    }
}