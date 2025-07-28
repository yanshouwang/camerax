package dev.zeekr.camerax_android.core

import androidx.camera.core.ZoomState
import dev.zeekr.camerax_android.CameraXImpl
import dev.zeekr.camerax_android.PigeonApiZoomStateApi

class ZoomStateImpl(impl: CameraXImpl) : PigeonApiZoomStateApi(impl) {
    override fun minZoomRatio(pigeon_instance: ZoomState): Double {
        return pigeon_instance.minZoomRatio.toDouble()
    }

    override fun maxZoomRatio(pigeon_instance: ZoomState): Double {
        return pigeon_instance.maxZoomRatio.toDouble()
    }

    override fun zoomRatio(pigeon_instance: ZoomState): Double {
        return pigeon_instance.zoomRatio.toDouble()
    }

    override fun linearZoom(pigeon_instance: ZoomState): Double {
        return pigeon_instance.linearZoom.toDouble()
    }
}