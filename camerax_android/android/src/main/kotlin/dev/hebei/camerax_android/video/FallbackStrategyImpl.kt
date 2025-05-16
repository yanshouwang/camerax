package dev.hebei.camerax_android.video

import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.PigeonApiFallbackStrategyApi

class FallbackStrategyImpl(impl: CameraXImpl) : PigeonApiFallbackStrategyApi(impl) {
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