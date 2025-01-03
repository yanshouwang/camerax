package dev.hebei.camerax_android.legacy.core

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiZoomState

class ZoomState(registrar: CameraXRegistrar) : PigeonApiZoomState(registrar) {
    override fun minZoomRatio(pigeon_instance: dev.hebei.camerax_android.core.ZoomState): Double {
        return pigeon_instance.minZoomRatio.toDouble()
    }

    override fun maxZoomRatio(pigeon_instance: dev.hebei.camerax_android.core.ZoomState): Double {
        return pigeon_instance.maxZoomRatio.toDouble()
    }

    override fun zoomRatio(pigeon_instance: dev.hebei.camerax_android.core.ZoomState): Double {
        return pigeon_instance.zoomRatio.toDouble()
    }

    override fun linearZoom(pigeon_instance: dev.hebei.camerax_android.core.ZoomState): Double {
        return pigeon_instance.linearZoom.toDouble()
    }
}