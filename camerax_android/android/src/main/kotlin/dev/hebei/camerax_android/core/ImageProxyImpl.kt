package dev.hebei.camerax_android.core

import dev.hebei.camerax_android.CameraXRegistrar
import dev.hebei.camerax_android.ImageFormatApi
import dev.hebei.camerax_android.PigeonApiImageProxyApi
import dev.hebei.camerax_android.PigeonApiPlaneProxyApi
import dev.hebei.camerax_android.common.imageFormatApi

class ImageProxyImpl(registrar: CameraXRegistrar) : PigeonApiImageProxyApi(registrar) {
    override fun format(pigeon_instance: androidx.camera.core.ImageProxy): ImageFormatApi {
        return pigeon_instance.format.imageFormatApi
    }

    override fun width(pigeon_instance: androidx.camera.core.ImageProxy): Long {
        return pigeon_instance.width.toLong()
    }

    override fun height(pigeon_instance: androidx.camera.core.ImageProxy): Long {
        return pigeon_instance.height.toLong()
    }

    override fun planes(pigeon_instance: androidx.camera.core.ImageProxy): List<androidx.camera.core.ImageProxy.PlaneProxy> {
        return pigeon_instance.planes.toList()
    }

    override fun imageInfo(pigeon_instance: androidx.camera.core.ImageProxy): androidx.camera.core.ImageInfo {
        return pigeon_instance.imageInfo
    }

    override fun getCropRect(pigeon_instance: androidx.camera.core.ImageProxy): android.graphics.Rect {
        return pigeon_instance.cropRect
    }

    override fun setCropRect(pigeon_instance: androidx.camera.core.ImageProxy, rect: android.graphics.Rect?) {
        pigeon_instance.setCropRect(rect)
    }

    class PlaneProxyImpl(registrar: CameraXRegistrar) : PigeonApiPlaneProxyApi(registrar) {
        override fun buffer(pigeon_instance: androidx.camera.core.ImageProxy.PlaneProxy): ByteArray {
            val buffer = pigeon_instance.buffer
            val size = buffer.remaining()
            val value = ByteArray(size)
            buffer.get(value)
            return value
        }

        override fun pixelStride(pigeon_instance: androidx.camera.core.ImageProxy.PlaneProxy): Long {
            return pigeon_instance.pixelStride.toLong()
        }

        override fun rowStride(pigeon_instance: androidx.camera.core.ImageProxy.PlaneProxy): Long {
            return pigeon_instance.rowStride.toLong()
        }
    }
}