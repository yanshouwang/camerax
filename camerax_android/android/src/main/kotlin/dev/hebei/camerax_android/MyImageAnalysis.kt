package dev.hebei.camerax_android

import androidx.annotation.Keep
import androidx.camera.core.ImageAnalysis
import androidx.camera.core.ImageProxy

@Keep
class MyImageAnalysis {
    companion object {
        const val STRATEGY_KEEP_ONLY_LATEST = ImageAnalysis.STRATEGY_KEEP_ONLY_LATEST
        const val STRATEGY_BLOCK_PRODUCER = ImageAnalysis.STRATEGY_BLOCK_PRODUCER
        const val COORDINATE_SYSTEM_ORIGINAL = ImageAnalysis.COORDINATE_SYSTEM_ORIGINAL
        const val COORDINATE_SYSTEM_SENSOR = ImageAnalysis.COORDINATE_SYSTEM_SENSOR
        const val COORDINATE_SYSTEM_VIEW_REFERENCED = ImageAnalysis.COORDINATE_SYSTEM_VIEW_REFERENCED
        const val OUTPUT_IMAGE_FORMAT_YUV_420_888 = ImageAnalysis.OUTPUT_IMAGE_FORMAT_YUV_420_888
        const val OUTPUT_IMAGE_FORMAT_RGBA_8888 = ImageAnalysis.OUTPUT_IMAGE_FORMAT_RGBA_8888
    }

    interface MyAnalyzer {
        fun analyze(image: ImageProxy)
    }

    class MyAnalyzerImpl(private val analyzer: MyAnalyzer) : ImageAnalysis.Analyzer {
        override fun analyze(image: ImageProxy) {
            analyzer.analyze(image)
        }
    }
}