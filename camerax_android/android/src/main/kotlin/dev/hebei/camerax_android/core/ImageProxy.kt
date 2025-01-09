package dev.hebei.camerax_android.core

import android.graphics.Bitmap
import android.graphics.Rect

class ImageProxy internal constructor(internal val obj: androidx.camera.core.ImageProxy) {
    val format get() = obj.format.imageFormatArgs
    val width get() = obj.width
    val height get() = obj.height
    val planes get() = obj.planes.map { PlaneProxy(it) }.toTypedArray()
    val cropRect get() = obj.cropRect
    val image
        @androidx.camera.core.ExperimentalGetImage get() = obj.image
    val imageInfo get() = ImageInfo(obj.imageInfo)

    fun setCropRect(rect: Rect?) {
        obj.setCropRect(rect)
    }

    fun toBitmap(): Bitmap {
        return obj.toBitmap()
    }

    fun close() {
        obj.close()
    }

    class PlaneProxy(internal val obj: androidx.camera.core.ImageProxy.PlaneProxy) {
        val buffer get() = obj.buffer
        val rowStride get() = obj.rowStride
        val pixelStride get() = obj.pixelStride
    }
}
