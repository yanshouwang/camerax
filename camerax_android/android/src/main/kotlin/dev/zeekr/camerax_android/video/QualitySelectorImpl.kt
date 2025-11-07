package dev.zeekr.camerax_android.video

import android.util.Size
import androidx.camera.core.CameraInfo
import androidx.camera.video.FallbackStrategy
import androidx.camera.video.Quality
import androidx.camera.video.QualitySelector
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiQualitySelectorProxyApi

class QualitySelectorImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiQualitySelectorProxyApi(registrar) {
    override fun from1(quality: Quality): QualitySelector {
        return QualitySelector.from(quality)
    }

    override fun from2(quality: Quality, fallbackStrategy: FallbackStrategy): QualitySelector {
        return QualitySelector.from(quality, fallbackStrategy)
    }

    override fun fromOrderedList1(qualities: List<Quality>): QualitySelector {
        return QualitySelector.fromOrderedList(qualities)
    }

    override fun fromOrderedList2(qualities: List<Quality>, fallbackStrategy: FallbackStrategy): QualitySelector {
        return QualitySelector.fromOrderedList(qualities, fallbackStrategy)
    }

    override fun getResolution(cameraInfo: CameraInfo, quality: Quality): Size? {
        return QualitySelector.getResolution(cameraInfo, quality)
    }
}