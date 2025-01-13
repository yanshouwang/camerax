package dev.hebei.camerax_android.legacy.core

import dev.hebei.camerax_android.legacy.*

class ImageAnalysis {
    class Analyzer(registrar: CameraXRegistrar) : PigeonApiAnalyzer(registrar)
}

val BackpressureStrategy.obj
    get() = when (this) {
        BackpressureStrategy.KEEP_ONLY_LATEST -> androidx.camera.core.ImageAnalysis.STRATEGY_KEEP_ONLY_LATEST
        BackpressureStrategy.BLOCK_PRODUCER -> androidx.camera.core.ImageAnalysis.STRATEGY_BLOCK_PRODUCER
    }

val Int.backpressureStrategyArgs
    get() = when (this) {
        androidx.camera.core.ImageAnalysis.STRATEGY_KEEP_ONLY_LATEST -> BackpressureStrategy.KEEP_ONLY_LATEST
        androidx.camera.core.ImageAnalysis.STRATEGY_BLOCK_PRODUCER -> BackpressureStrategy.BLOCK_PRODUCER
        else -> throw IllegalArgumentException()
    }

val ImageFormat.imageAnalysisObj
    get() = when (this) {
        ImageFormat.YUV420_888 -> androidx.camera.core.ImageAnalysis.OUTPUT_IMAGE_FORMAT_YUV_420_888
        ImageFormat.RGBA8888 -> androidx.camera.core.ImageAnalysis.OUTPUT_IMAGE_FORMAT_RGBA_8888
        else -> throw IllegalArgumentException()
    }

val Int.imageAnalysisImageFormatArgs
    get() = when (this) {
        androidx.camera.core.ImageAnalysis.OUTPUT_IMAGE_FORMAT_YUV_420_888 -> ImageFormat.YUV420_888
        androidx.camera.core.ImageAnalysis.OUTPUT_IMAGE_FORMAT_RGBA_8888 -> ImageFormat.RGBA8888
        else -> throw IllegalArgumentException()
    }

val CoordinateSystem.obj
    get() = when (this) {
        CoordinateSystem.ORIGINAL -> androidx.camera.core.ImageAnalysis.COORDINATE_SYSTEM_ORIGINAL
        CoordinateSystem.SENSOR -> androidx.camera.core.ImageAnalysis.COORDINATE_SYSTEM_SENSOR
        CoordinateSystem.VIEW_REFERENCED -> androidx.camera.core.ImageAnalysis.COORDINATE_SYSTEM_VIEW_REFERENCED
    }