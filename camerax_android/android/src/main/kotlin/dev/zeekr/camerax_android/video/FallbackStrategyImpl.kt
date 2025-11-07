package dev.zeekr.camerax_android.video

import androidx.camera.video.FallbackStrategy
import androidx.camera.video.Quality
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiFallbackStrategyProxyApi

class FallbackStrategyImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiFallbackStrategyProxyApi(registrar) {
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