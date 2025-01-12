package dev.hebei.camerax_android.legacy.video

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiQualitySelector

class QualitySelector(registrar: CameraXRegistrar) : PigeonApiQualitySelector(registrar) {
    override fun from(
        quality: androidx.camera.video.Quality, fallbackStrategy: androidx.camera.video.FallbackStrategy?
    ): androidx.camera.video.QualitySelector {
        return if (fallbackStrategy == null) androidx.camera.video.QualitySelector.from(quality)
        else androidx.camera.video.QualitySelector.from(quality, fallbackStrategy)
    }

    override fun fromOrderedList(
        qualities: List<androidx.camera.video.Quality>, fallbackStrategy: androidx.camera.video.FallbackStrategy?
    ): androidx.camera.video.QualitySelector {
        return if (fallbackStrategy == null) androidx.camera.video.QualitySelector.fromOrderedList(qualities)
        else androidx.camera.video.QualitySelector.fromOrderedList(qualities, fallbackStrategy)
    }

    override fun getResolution(
        cameraInfo: androidx.camera.core.CameraInfo, quality: androidx.camera.video.Quality
    ): android.util.Size? {
        return androidx.camera.video.QualitySelector.getResolution(cameraInfo, quality)
    }
}