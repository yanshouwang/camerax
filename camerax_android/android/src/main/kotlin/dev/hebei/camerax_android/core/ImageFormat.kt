package dev.hebei.camerax_android.core

enum class ImageFormat {
    DEPTH16, DEPTH_JPEG, DEPTH_POINT_CLOUD, FLEX_RGBA_8888, FLEX_RGB_888, HEIC, JPEG, JPEG_R, NV16, NV21, PRIVATE, RAW10, RAW12, RAW_PRIVATE, RAW_SENSOR, RGB_565, UNKNOWN, Y8, YCBCR_P010, YCBCR_P210, YUV_420_888, YUV_422_888, YUV_444_888, YUY2, YV12,
}

val Int.imageFormatArgs
    get() = when (this) {
        android.graphics.ImageFormat.DEPTH16 -> ImageFormat.DEPTH16
        android.graphics.ImageFormat.DEPTH_JPEG -> ImageFormat.DEPTH_JPEG
        android.graphics.ImageFormat.DEPTH_POINT_CLOUD -> ImageFormat.DEPTH_POINT_CLOUD
        android.graphics.ImageFormat.FLEX_RGBA_8888 -> ImageFormat.FLEX_RGBA_8888
        android.graphics.ImageFormat.FLEX_RGB_888 -> ImageFormat.FLEX_RGB_888
        android.graphics.ImageFormat.HEIC -> ImageFormat.HEIC
        android.graphics.ImageFormat.JPEG -> ImageFormat.JPEG
        android.graphics.ImageFormat.JPEG_R -> ImageFormat.JPEG_R
        android.graphics.ImageFormat.NV16 -> ImageFormat.NV16
        android.graphics.ImageFormat.NV21 -> ImageFormat.NV21
        android.graphics.ImageFormat.PRIVATE -> ImageFormat.PRIVATE
        android.graphics.ImageFormat.RAW10 -> ImageFormat.RAW10
        android.graphics.ImageFormat.RAW12 -> ImageFormat.RAW12
        android.graphics.ImageFormat.RAW_PRIVATE -> ImageFormat.RAW_PRIVATE
        android.graphics.ImageFormat.RAW_SENSOR -> ImageFormat.RAW_SENSOR
        android.graphics.ImageFormat.RGB_565 -> ImageFormat.RGB_565
        android.graphics.ImageFormat.UNKNOWN -> ImageFormat.UNKNOWN
        android.graphics.ImageFormat.Y8 -> ImageFormat.Y8
        android.graphics.ImageFormat.YCBCR_P010 -> ImageFormat.YCBCR_P010
        // android.graphics.ImageFormat.YCBCR_P210 -> ImageFormat.YCBCR_P210
        android.graphics.ImageFormat.YUV_420_888 -> ImageFormat.YUV_420_888
        android.graphics.ImageFormat.YUV_422_888 -> ImageFormat.YUV_422_888
        android.graphics.ImageFormat.YUV_444_888 -> ImageFormat.YUV_444_888
        android.graphics.ImageFormat.YUY2 -> ImageFormat.YUY2
        android.graphics.ImageFormat.YV12 -> ImageFormat.YV12
        else -> throw IllegalArgumentException()
    }