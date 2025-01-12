package dev.hebei.camerax_android.legacy.core

import dev.hebei.camerax_android.legacy.*

class ImageProxy(registrar: CameraXRegistrar) : PigeonApiImageProxy(registrar) {
    override fun getFormat(pigeon_instance: androidx.camera.core.ImageProxy): ImageFormat {
        return pigeon_instance.format.imageFormatArgs
    }

    override fun getWidth(pigeon_instance: androidx.camera.core.ImageProxy): Long {
        return pigeon_instance.width.toLong()
    }

    override fun getHieght(pigeon_instance: androidx.camera.core.ImageProxy): Long {
        return pigeon_instance.height.toLong()
    }

    override fun getPlanes(pigeon_instance: androidx.camera.core.ImageProxy): List<androidx.camera.core.ImageProxy.PlaneProxy> {
        return pigeon_instance.planes.toList()
    }

    override fun getImageInfo(pigeon_instance: androidx.camera.core.ImageProxy): androidx.camera.core.ImageInfo {
        return pigeon_instance.imageInfo
    }

    override fun getCropRect(pigeon_instance: androidx.camera.core.ImageProxy): android.graphics.Rect {
        return pigeon_instance.cropRect
    }

    override fun setCropRect(pigeon_instance: androidx.camera.core.ImageProxy, rect: android.graphics.Rect?) {
        pigeon_instance.setCropRect(rect)
    }

    class PlaneProxy(registrar: CameraXRegistrar) : PigeonApiPlaneProxy(registrar) {
        override fun getBuffer(pigeon_instance: androidx.camera.core.ImageProxy.PlaneProxy): ByteArray {
            val buffer = pigeon_instance.buffer
            val size = buffer.remaining()
            val value = ByteArray(size)
            buffer.get(value)
            return value
        }

        override fun getPixelStride(pigeon_instance: androidx.camera.core.ImageProxy.PlaneProxy): Long {
            return pigeon_instance.pixelStride.toLong()
        }

        override fun getRowStride(pigeon_instance: androidx.camera.core.ImageProxy.PlaneProxy): Long {
            return pigeon_instance.rowStride.toLong()
        }
    }
}