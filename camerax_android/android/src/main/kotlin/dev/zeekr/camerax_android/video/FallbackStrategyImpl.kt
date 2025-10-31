package dev.zeekr.camerax_android.video

import androidx.camera.video.FallbackStrategy
import androidx.camera.video.Quality
import dev.zeekr.camerax_android.CameraXRegistrarImpl
import dev.zeekr.camerax_android.PigeonApiFallbackStrategyApi

class FallbackStrategyImpl(impl: CameraXRegistrarImpl) : PigeonApiFallbackStrategyApi(impl) {
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