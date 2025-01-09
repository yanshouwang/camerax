package dev.hebei.camerax_android.core

class ImageAnalysis {
    class Analyzer {
        internal constructor(obj: androidx.camera.core.ImageAnalysis.Analyzer) {
            this.obj = obj
        }

        constructor(stub: Stub) {
            this.obj = androidx.camera.core.ImageAnalysis.Analyzer { image ->
                stub.analyze(ImageProxy(image))
            }
        }

        internal val obj: androidx.camera.core.ImageAnalysis.Analyzer

        interface Stub {
            fun analyze(image: ImageProxy)
        }
    }

    enum class BackpressureStrategy {
        KEEP_ONLY_LATEST, BLOCK_PRODUCER,
    }

//    enum class Coordinate {
//        SYSTEM_ORIGINAL, SYSTEM_SENSOR, SYSTEM_VIEW_REFERENCED,
//    }
}

val ImageAnalysis.BackpressureStrategy.obj
    get() = when (this) {
        ImageAnalysis.BackpressureStrategy.KEEP_ONLY_LATEST -> androidx.camera.core.ImageAnalysis.STRATEGY_KEEP_ONLY_LATEST
        ImageAnalysis.BackpressureStrategy.BLOCK_PRODUCER -> androidx.camera.core.ImageAnalysis.STRATEGY_BLOCK_PRODUCER
    }

val Int.backpressureStrategyArgs
    get() = when (this) {
        androidx.camera.core.ImageAnalysis.STRATEGY_KEEP_ONLY_LATEST -> ImageAnalysis.BackpressureStrategy.KEEP_ONLY_LATEST
        androidx.camera.core.ImageAnalysis.STRATEGY_BLOCK_PRODUCER -> ImageAnalysis.BackpressureStrategy.BLOCK_PRODUCER
        else -> throw IllegalArgumentException()
    }

val ImageFormat.imageAnalysisObj
    get() = when (this) {
        ImageFormat.YUV_420_888 -> androidx.camera.core.ImageAnalysis.OUTPUT_IMAGE_FORMAT_YUV_420_888
        ImageFormat.FLEX_RGBA_8888 -> androidx.camera.core.ImageAnalysis.OUTPUT_IMAGE_FORMAT_RGBA_8888
        else -> throw IllegalArgumentException()
    }

val Int.imageAnalysisImageFormatArgs
    get() = when (this) {
        androidx.camera.core.ImageAnalysis.OUTPUT_IMAGE_FORMAT_YUV_420_888 -> ImageFormat.YUV_420_888
        androidx.camera.core.ImageAnalysis.OUTPUT_IMAGE_FORMAT_RGBA_8888 -> ImageFormat.FLEX_RGBA_8888
        else -> throw IllegalArgumentException()
    }