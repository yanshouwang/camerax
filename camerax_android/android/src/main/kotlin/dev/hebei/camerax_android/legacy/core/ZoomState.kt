package dev.hebei.camerax_android.legacy.core

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiZoomState

class ZoomState(registrar: CameraXRegistrar) : PigeonApiZoomState(registrar) {
    override fun getMinZoomRatio(pigeon_instance: androidx.camera.core.ZoomState): Double {
        return pigeon_instance.minZoomRatio.toDouble()
    }

    override fun getMaxZoomRatio(pigeon_instance: androidx.camera.core.ZoomState): Double {
        return pigeon_instance.maxZoomRatio.toDouble()
    }

    override fun getZoomRatio(pigeon_instance: androidx.camera.core.ZoomState): Double {
        return pigeon_instance.zoomRatio.toDouble()
    }

    override fun getLinearZoom(pigeon_instance: androidx.camera.core.ZoomState): Double {
        return pigeon_instance.linearZoom.toDouble()
    }
}