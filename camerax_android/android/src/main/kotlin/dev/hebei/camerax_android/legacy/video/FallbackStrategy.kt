package dev.hebei.camerax_android.legacy.video

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiFallbackStrategy

class FallbackStrategy(registrar: CameraXRegistrar) : PigeonApiFallbackStrategy(registrar) {
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