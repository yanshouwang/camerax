package dev.hebei.camerax_android.core

import dev.hebei.camerax_android.BackpressureStrategyApi
import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.CoordinateSystemApi
import dev.hebei.camerax_android.ImageFormatApi
import dev.hebei.camerax_android.PigeonApiAnalyzerApi

class ImageAnalysisImpl {
    class AnalyzerImpl(impl: CameraXImpl) : PigeonApiAnalyzerApi(impl)
}

val BackpressureStrategyApi.impl
    get() = when (this) {
        BackpressureStrategyApi.KEEP_ONLY_LATEST -> androidx.camera.core.ImageAnalysis.STRATEGY_KEEP_ONLY_LATEST
        BackpressureStrategyApi.BLOCK_PRODUCER -> androidx.camera.core.ImageAnalysis.STRATEGY_BLOCK_PRODUCER
    }

val Int.backpressureStrategyApi
    get() = when (this) {
        androidx.camera.core.ImageAnalysis.STRATEGY_KEEP_ONLY_LATEST -> BackpressureStrategyApi.KEEP_ONLY_LATEST
        androidx.camera.core.ImageAnalysis.STRATEGY_BLOCK_PRODUCER -> BackpressureStrategyApi.BLOCK_PRODUCER
        else -> throw IllegalArgumentException()
    }

val ImageFormatApi.imageAnalysisImpl
    get() = when (this) {
        ImageFormatApi.YUV420_888 -> androidx.camera.core.ImageAnalysis.OUTPUT_IMAGE_FORMAT_YUV_420_888
        ImageFormatApi.RGBA8888 -> androidx.camera.core.ImageAnalysis.OUTPUT_IMAGE_FORMAT_RGBA_8888
        else -> throw IllegalArgumentException()
    }

val Int.imageAnalysisImageFormatApi
    get() = when (this) {
        androidx.camera.core.ImageAnalysis.OUTPUT_IMAGE_FORMAT_YUV_420_888 -> ImageFormatApi.YUV420_888
        androidx.camera.core.ImageAnalysis.OUTPUT_IMAGE_FORMAT_RGBA_8888 -> ImageFormatApi.RGBA8888
        else -> throw IllegalArgumentException()
    }

val CoordinateSystemApi.impl
    get() = when (this) {
        CoordinateSystemApi.ORIGINAL -> androidx.camera.core.ImageAnalysis.COORDINATE_SYSTEM_ORIGINAL
        CoordinateSystemApi.SENSOR -> androidx.camera.core.ImageAnalysis.COORDINATE_SYSTEM_SENSOR
        CoordinateSystemApi.VIEW_REFERENCED -> androidx.camera.core.ImageAnalysis.COORDINATE_SYSTEM_VIEW_REFERENCED
    }