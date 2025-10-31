package dev.zeekr.camerax_android.video

import android.util.Size
import androidx.camera.core.CameraInfo
import androidx.camera.video.FallbackStrategy
import androidx.camera.video.Quality
import androidx.camera.video.QualitySelector
import dev.zeekr.camerax_android.CameraXRegistrarImpl
import dev.zeekr.camerax_android.PigeonApiQualitySelectorApi

class QualitySelectorImpl(impl: CameraXRegistrarImpl) : PigeonApiQualitySelectorApi(impl) {
    override fun from(quality: Quality, fallbackStrategy: FallbackStrategy?): QualitySelector {
        return if (fallbackStrategy == null) QualitySelector.from(quality)
        else QualitySelector.from(quality, fallbackStrategy)
    }

    override fun fromOrderedList(qualities: List<Quality>, fallbackStrategy: FallbackStrategy?): QualitySelector {
        return if (fallbackStrategy == null) QualitySelector.fromOrderedList(qualities)
        else QualitySelector.fromOrderedList(qualities, fallbackStrategy)
    }

    override fun getResolution(cameraInfo: CameraInfo, quality: Quality): Size? {
        return QualitySelector.getResolution(cameraInfo, quality)
    }
}