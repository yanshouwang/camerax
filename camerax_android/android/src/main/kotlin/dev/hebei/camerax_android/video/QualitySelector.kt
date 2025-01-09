package dev.hebei.camerax_android.video

import android.util.Size
import dev.hebei.camerax_android.core.CameraInfo

class QualitySelector internal constructor(internal val obj: androidx.camera.video.QualitySelector) {
    companion object {
        fun from(quality: Quality): QualitySelector {
            val obj = androidx.camera.video.QualitySelector.from(quality.obj)
            return QualitySelector(obj)
        }

        fun from(quality: Quality, fallbackStrategy: FallbackStrategy): QualitySelector {
            val obj = androidx.camera.video.QualitySelector.from(quality.obj, fallbackStrategy.obj)
            return QualitySelector(obj)
        }

        fun fromOrderedList(qualities: MutableList<Quality>): QualitySelector {
            val obj =
                androidx.camera.video.QualitySelector.fromOrderedList(qualities.map { it.obj })
            return QualitySelector(obj)
        }

        fun fromOrderedList(
            qualities: MutableList<Quality>, fallbackStrategy: FallbackStrategy
        ): QualitySelector {
            val obj = androidx.camera.video.QualitySelector.fromOrderedList(
                qualities.map { it.obj }, fallbackStrategy.obj
            )
            return QualitySelector(obj)
        }

        fun getResolution(cameraInfo: CameraInfo, quality: Quality): Size? {
            return androidx.camera.video.QualitySelector.getResolution(cameraInfo.obj, quality.obj)
        }
    }
}