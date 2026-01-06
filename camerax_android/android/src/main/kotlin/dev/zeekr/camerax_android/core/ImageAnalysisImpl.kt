package dev.zeekr.camerax_android.core

import android.util.Size
import androidx.camera.core.ImageAnalysis
import androidx.camera.core.ImageProxy
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.ImageAnalysisCoordinateSystemApi
import dev.zeekr.camerax_android.ImageAnalysisOutputImageFormatApi
import dev.zeekr.camerax_android.ImageAnalysisStrategyApi
import dev.zeekr.camerax_android.PigeonApiImageAnalysisAnalyzerImplProxyApi
import dev.zeekr.camerax_android.PigeonApiImageAnalysisAnalyzerProxyApi
import dev.zeekr.camerax_android.common.ImageProxyConsumer

class ImageAnalysisImpl {
    class AnalyzerImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
        PigeonApiImageAnalysisAnalyzerProxyApi(registrar) {
        override fun analyze(pigeon_instance: ImageAnalysis.Analyzer, image: ImageProxy) {
            return pigeon_instance.analyze(image)
        }

        override fun getDefaultTargetResolution(pigeon_instance: ImageAnalysis.Analyzer): Size? {
            return pigeon_instance.defaultTargetResolution
        }

        override fun getTargetCoordinateSystem(pigeon_instance: ImageAnalysis.Analyzer): ImageAnalysisCoordinateSystemApi {
            return pigeon_instance.targetCoordinateSystem.imageAnalysisCoordinateSystemApi
        }
    }

    class AnalyzerImplImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
        PigeonApiImageAnalysisAnalyzerImplProxyApi(registrar) {
        override fun pigeon_defaultConstructor(consumer: ImageProxyConsumer): ImageAnalysis.Analyzer {
            return ImageAnalysis.Analyzer { image -> consumer.accept(image) }
        }
    }
}

val Int.imageAnalysisStrategyApi: ImageAnalysisStrategyApi
    get() = when (this) {
        ImageAnalysis.STRATEGY_KEEP_ONLY_LATEST -> ImageAnalysisStrategyApi.KEEP_ONLY_LATEST
        ImageAnalysis.STRATEGY_BLOCK_PRODUCER -> ImageAnalysisStrategyApi.BLOCK_PRODUCER
        else -> throw NotImplementedError("Not implemented value: $this")
    }

val Int.imageAnalysisCoordinateSystemApi: ImageAnalysisCoordinateSystemApi
    get() = when (this) {
        ImageAnalysis.COORDINATE_SYSTEM_ORIGINAL -> ImageAnalysisCoordinateSystemApi.ORIGINAL
        ImageAnalysis.COORDINATE_SYSTEM_SENSOR -> ImageAnalysisCoordinateSystemApi.SENSOR
        ImageAnalysis.COORDINATE_SYSTEM_VIEW_REFERENCED -> ImageAnalysisCoordinateSystemApi.VIEW_REFERENCED
        else -> throw NotImplementedError("Not implemented value: $this")
    }

val Int.imageAnalysisOutputImageFormatApi: ImageAnalysisOutputImageFormatApi
    get() = when (this) {
        ImageAnalysis.OUTPUT_IMAGE_FORMAT_YUV_420_888 -> ImageAnalysisOutputImageFormatApi.YUV420_888
        ImageAnalysis.OUTPUT_IMAGE_FORMAT_RGBA_8888 -> ImageAnalysisOutputImageFormatApi.RGBA8888
        ImageAnalysis.OUTPUT_IMAGE_FORMAT_NV21 -> ImageAnalysisOutputImageFormatApi.NV21
        else -> throw NotImplementedError("Not implemented value: $this")
    }

val ImageAnalysisStrategyApi.impl: Int
    get() = when (this) {
        ImageAnalysisStrategyApi.KEEP_ONLY_LATEST -> ImageAnalysis.STRATEGY_KEEP_ONLY_LATEST
        ImageAnalysisStrategyApi.BLOCK_PRODUCER -> ImageAnalysis.STRATEGY_BLOCK_PRODUCER
    }

val ImageAnalysisCoordinateSystemApi.impl: Int
    get() = when (this) {
        ImageAnalysisCoordinateSystemApi.ORIGINAL -> ImageAnalysis.COORDINATE_SYSTEM_ORIGINAL
        ImageAnalysisCoordinateSystemApi.SENSOR -> ImageAnalysis.COORDINATE_SYSTEM_SENSOR
        ImageAnalysisCoordinateSystemApi.VIEW_REFERENCED -> ImageAnalysis.COORDINATE_SYSTEM_VIEW_REFERENCED
    }

val ImageAnalysisOutputImageFormatApi.impl: Int
    get() = when (this) {
        ImageAnalysisOutputImageFormatApi.YUV420_888 -> ImageAnalysis.OUTPUT_IMAGE_FORMAT_YUV_420_888
        ImageAnalysisOutputImageFormatApi.RGBA8888 -> ImageAnalysis.OUTPUT_IMAGE_FORMAT_RGBA_8888
        ImageAnalysisOutputImageFormatApi.NV21 -> ImageAnalysis.OUTPUT_IMAGE_FORMAT_RGBA_8888
    }
