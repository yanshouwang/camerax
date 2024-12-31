package dev.hebei.camerax_android.core

class ZoomState internal constructor(internal val obj: androidx.camera.core.ZoomState) {
    val minZoomRatio get() = obj.minZoomRatio
    val maxZoomRatio get() = obj.maxZoomRatio
    val zoomRatio get() = obj.zoomRatio
    val linearZoom get() = obj.linearZoom
}