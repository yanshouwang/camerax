package dev.hebei.camerax_android.core

import dev.hebei.camerax_android.CameraXRegistrar
import dev.hebei.camerax_android.PigeonApiZoomStateApi

class ZoomStateImpl(registrar: CameraXRegistrar) : PigeonApiZoomStateApi(registrar) {
    override fun minZoomRatio(pigeon_instance: androidx.camera.core.ZoomState): Double {
        return pigeon_instance.minZoomRatio.toDouble()
    }

    override fun maxZoomRatio(pigeon_instance: androidx.camera.core.ZoomState): Double {
        return pigeon_instance.maxZoomRatio.toDouble()
    }

    override fun zoomRatio(pigeon_instance: androidx.camera.core.ZoomState): Double {
        return pigeon_instance.zoomRatio.toDouble()
    }

    override fun linearZoom(pigeon_instance: androidx.camera.core.ZoomState): Double {
        return pigeon_instance.linearZoom.toDouble()
    }
}