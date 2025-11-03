package dev.zeekr.camerax_android.core

import androidx.camera.core.ImageAnalysis
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.ImageAnalysisCoordinateSystemApi
import dev.zeekr.camerax_android.ImageAnalysisOutputImageFormatApi
import dev.zeekr.camerax_android.ImageAnalysisStrategyApi
import dev.zeekr.camerax_android.PigeonApiImageAnalysisAnalyzerApi

class ImageAnalysisImpl {
    class AnalyzerImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiImageAnalysisAnalyzerApi(registrar)
}

val ImageAnalysisStrategyApi.impl: Int
    get() = when (this) {
        ImageAnalysisStrategyApi.KEEP_ONLY_LATEST -> ImageAnalysis.STRATEGY_KEEP_ONLY_LATEST
        ImageAnalysisStrategyApi.BLOCK_PRODUCER -> ImageAnalysis.STRATEGY_BLOCK_PRODUCER
    }

val Int.imageAnalysisStrategyApi: ImageAnalysisStrategyApi
    get() = when (this) {
        ImageAnalysis.STRATEGY_KEEP_ONLY_LATEST -> ImageAnalysisStrategyApi.KEEP_ONLY_LATEST
        ImageAnalysis.STRATEGY_BLOCK_PRODUCER -> ImageAnalysisStrategyApi.BLOCK_PRODUCER
        else -> throw IllegalArgumentException()
    }

val ImageAnalysisOutputImageFormatApi.impl: Int
    get() = when (this) {
        ImageAnalysisOutputImageFormatApi.YUV420_888 -> ImageAnalysis.OUTPUT_IMAGE_FORMAT_YUV_420_888
        ImageAnalysisOutputImageFormatApi.RGBA8888 -> ImageAnalysis.OUTPUT_IMAGE_FORMAT_RGBA_8888
        ImageAnalysisOutputImageFormatApi.NV21 -> ImageAnalysis.OUTPUT_IMAGE_FORMAT_RGBA_8888
    }

val Int.imageAnalysisOutputImageFormatApi: ImageAnalysisOutputImageFormatApi
    get() = when (this) {
        ImageAnalysis.OUTPUT_IMAGE_FORMAT_YUV_420_888 -> ImageAnalysisOutputImageFormatApi.YUV420_888
        ImageAnalysis.OUTPUT_IMAGE_FORMAT_RGBA_8888 -> ImageAnalysisOutputImageFormatApi.RGBA8888
        ImageAnalysis.OUTPUT_IMAGE_FORMAT_NV21 -> ImageAnalysisOutputImageFormatApi.NV21
        else -> throw IllegalArgumentException()
    }

val ImageAnalysisCoordinateSystemApi.impl: Int
    get() = when (this) {
        ImageAnalysisCoordinateSystemApi.ORIGINAL -> ImageAnalysis.COORDINATE_SYSTEM_ORIGINAL
        ImageAnalysisCoordinateSystemApi.SENSOR -> ImageAnalysis.COORDINATE_SYSTEM_SENSOR
        ImageAnalysisCoordinateSystemApi.VIEW_REFERENCED -> ImageAnalysis.COORDINATE_SYSTEM_VIEW_REFERENCED
    }