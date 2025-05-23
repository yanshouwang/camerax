package dev.hebei.camerax_android.video

import androidx.camera.video.FallbackStrategy
import androidx.camera.video.Quality
import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.PigeonApiFallbackStrategyApi

class FallbackStrategyImpl(impl: CameraXImpl) : PigeonApiFallbackStrategyApi(impl) {
    override fun higherQualityOrLowerThan(quality: Quality): FallbackStrategy {
        return FallbackStrategy.higherQualityOrLowerThan(quality)
    }

    override fun higherQualityThan(quality: Quality): FallbackStrategy {
        return FallbackStrategy.higherQualityThan(quality)
    }

    override fun lowerQualityOrHigherThan(quality: Quality): FallbackStrategy {
        return FallbackStrategy.lowerQualityOrHigherThan(quality)
    }

    override fun lowerQualityThan(quality: Quality): FallbackStrategy {
        return FallbackStrategy.lowerQualityThan(quality)
    }
}