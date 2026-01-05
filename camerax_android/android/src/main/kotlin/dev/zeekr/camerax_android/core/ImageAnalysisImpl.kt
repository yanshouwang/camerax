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
import dev.zeekr.camerax_android.PigeonApiImageAnalysisUtilProxyApi
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

        override fun getTargetCoordinateSystem(pigeon_instance: ImageAnalysis.Analyzer): Long {
            return pigeon_instance.targetCoordinateSystem.toLong()
        }
    }

    class UtilImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiImageAnalysisUtilProxyApi(registrar) {
        override fun fromStrategy(value: Long): ImageAnalysisStrategyApi {
            return Util.fromStrategy(value.toInt())
        }

        override fun fromCoordinateSystem(value: Long): ImageAnalysisCoordinateSystemApi {
            return Util.fromCoordinateSystem(value.toInt())
        }

        override fun fromOutputImageFormat(value: Long): ImageAnalysisOutputImageFormatApi {
            return Util.fromOutputImageFormat(value.toInt())
        }

        override fun toStrategy(api: ImageAnalysisStrategyApi): Long {
            return Util.toStrategy(api).toLong()
        }

        override fun toCoordinateSystem(api: ImageAnalysisCoordinateSystemApi): Long {
            return Util.toCoordinateSystem(api).toLong()
        }

        override fun toOutputImageFormat(api: ImageAnalysisOutputImageFormatApi): Long {
            return Util.toOutputImageFormat(api).toLong()
        }
    }

    class AnalyzerImplImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
        PigeonApiImageAnalysisAnalyzerImplProxyApi(registrar) {
        override fun pigeon_defaultConstructor(consumer: ImageProxyConsumer): ImageAnalysis.Analyzer {
            return ImageAnalysis.Analyzer { image -> consumer.accept(image) }
        }
    }

    object Util {
        fun fromStrategy(value: Int): ImageAnalysisStrategyApi {
            return when (value) {
                ImageAnalysis.STRATEGY_KEEP_ONLY_LATEST -> ImageAnalysisStrategyApi.KEEP_ONLY_LATEST
                ImageAnalysis.STRATEGY_BLOCK_PRODUCER -> ImageAnalysisStrategyApi.BLOCK_PRODUCER
                else -> throw NotImplementedError("Not implemented value: $this")
            }
        }

        fun fromCoordinateSystem(value: Int): ImageAnalysisCoordinateSystemApi {
            return when (value) {
                ImageAnalysis.COORDINATE_SYSTEM_ORIGINAL -> ImageAnalysisCoordinateSystemApi.ORIGINAL
                ImageAnalysis.COORDINATE_SYSTEM_SENSOR -> ImageAnalysisCoordinateSystemApi.SENSOR
                ImageAnalysis.COORDINATE_SYSTEM_VIEW_REFERENCED -> ImageAnalysisCoordinateSystemApi.VIEW_REFERENCED
                else -> throw NotImplementedError("Not implemented value: $this")
            }
        }

        fun fromOutputImageFormat(value: Int): ImageAnalysisOutputImageFormatApi {
            return when (value) {
                ImageAnalysis.OUTPUT_IMAGE_FORMAT_YUV_420_888 -> ImageAnalysisOutputImageFormatApi.YUV420_888
                ImageAnalysis.OUTPUT_IMAGE_FORMAT_RGBA_8888 -> ImageAnalysisOutputImageFormatApi.RGBA8888
                ImageAnalysis.OUTPUT_IMAGE_FORMAT_NV21 -> ImageAnalysisOutputImageFormatApi.NV21
                else -> throw NotImplementedError("Not implemented value: $this")
            }
        }

        fun toStrategy(api: ImageAnalysisStrategyApi): Int {
            return when (api) {
                ImageAnalysisStrategyApi.KEEP_ONLY_LATEST -> ImageAnalysis.STRATEGY_KEEP_ONLY_LATEST
                ImageAnalysisStrategyApi.BLOCK_PRODUCER -> ImageAnalysis.STRATEGY_BLOCK_PRODUCER
            }
        }

        fun toCoordinateSystem(api: ImageAnalysisCoordinateSystemApi): Int {
            return when (api) {
                ImageAnalysisCoordinateSystemApi.ORIGINAL -> ImageAnalysis.COORDINATE_SYSTEM_ORIGINAL
                ImageAnalysisCoordinateSystemApi.SENSOR -> ImageAnalysis.COORDINATE_SYSTEM_SENSOR
                ImageAnalysisCoordinateSystemApi.VIEW_REFERENCED -> ImageAnalysis.COORDINATE_SYSTEM_VIEW_REFERENCED
            }

        }

        fun toOutputImageFormat(api: ImageAnalysisOutputImageFormatApi): Int {
            return when (api) {
                ImageAnalysisOutputImageFormatApi.YUV420_888 -> ImageAnalysis.OUTPUT_IMAGE_FORMAT_YUV_420_888
                ImageAnalysisOutputImageFormatApi.RGBA8888 -> ImageAnalysis.OUTPUT_IMAGE_FORMAT_RGBA_8888
                ImageAnalysisOutputImageFormatApi.NV21 -> ImageAnalysis.OUTPUT_IMAGE_FORMAT_RGBA_8888
            }
        }
    }
}
