package dev.hebei.camerax_android.video

class FallbackStrategy internal constructor(internal val obj: androidx.camera.video.FallbackStrategy) {
    companion object {
        fun higherQualityOrLowerThan(quality: Quality): FallbackStrategy {
            val obj = androidx.camera.video.FallbackStrategy.higherQualityOrLowerThan(quality.obj)
            return FallbackStrategy(obj)
        }

        fun higherQualityThan(quality: Quality): FallbackStrategy {
            val obj = androidx.camera.video.FallbackStrategy.higherQualityThan(quality.obj)
            return FallbackStrategy(obj)
        }

        fun lowerQualityOrHigherThan(quality: Quality): FallbackStrategy {
            val obj = androidx.camera.video.FallbackStrategy.lowerQualityOrHigherThan(quality.obj)
            return FallbackStrategy(obj)
        }

        fun lowerQualityThan(quality: Quality): FallbackStrategy {
            val obj = androidx.camera.video.FallbackStrategy.lowerQualityThan(quality.obj)
            return FallbackStrategy(obj)
        }
    }
}