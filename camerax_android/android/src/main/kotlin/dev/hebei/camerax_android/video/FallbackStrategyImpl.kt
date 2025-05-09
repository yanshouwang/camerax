package dev.hebei.camerax_android.video

import dev.hebei.camerax_android.CameraXRegistrar
import dev.hebei.camerax_android.PigeonApiFallbackStrategyApi

class FallbackStrategyImpl(registrar: CameraXRegistrar) : PigeonApiFallbackStrategyApi(registrar) {
    override fun higherQualityOrLowerThan(quality: androidx.camera.video.Quality): androidx.camera.video.FallbackStrategy {
        return androidx.camera.video.FallbackStrategy.higherQualityOrLowerThan(quality)
    }

    override fun higherQualityThan(quality: androidx.camera.video.Quality): androidx.camera.video.FallbackStrategy {
        return androidx.camera.video.FallbackStrategy.higherQualityThan(quality)
    }

    override fun lowerQualityOrHigherThan(quality: androidx.camera.video.Quality): androidx.camera.video.FallbackStrategy {
        return androidx.camera.video.FallbackStrategy.lowerQualityOrHigherThan(quality)
    }

    override fun lowerQualityThan(quality: androidx.camera.video.Quality): androidx.camera.video.FallbackStrategy {
        return androidx.camera.video.FallbackStrategy.lowerQualityThan(quality)
    }
}