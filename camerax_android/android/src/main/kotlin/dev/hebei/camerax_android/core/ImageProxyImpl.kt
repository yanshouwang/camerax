package dev.hebei.camerax_android.core

import android.graphics.Rect
import androidx.camera.core.ImageInfo
import androidx.camera.core.ImageProxy
import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.ImageFormatApi
import dev.hebei.camerax_android.PigeonApiImageProxyApi
import dev.hebei.camerax_android.PigeonApiPlaneProxyApi
import dev.hebei.camerax_android.common.imageFormatApi
import java.nio.ByteBuffer

class ImageProxyImpl(impl: CameraXImpl) : PigeonApiImageProxyApi(impl) {
    override fun format(pigeon_instance: ImageProxy): ImageFormatApi {
        return pigeon_instance.format.imageFormatApi
    }

    override fun width(pigeon_instance: ImageProxy): Long {
        return pigeon_instance.width.toLong()
    }

    override fun height(pigeon_instance: ImageProxy): Long {
        return pigeon_instance.height.toLong()
    }

    override fun planes(pigeon_instance: ImageProxy): List<ImageProxy.PlaneProxy> {
        return pigeon_instance.planes.toList()
    }

    override fun imageInfo(pigeon_instance: ImageProxy): ImageInfo {
        return pigeon_instance.imageInfo
    }

    override fun getCropRect(pigeon_instance: ImageProxy): Rect {
        return pigeon_instance.cropRect
    }

    override fun setCropRect(pigeon_instance: ImageProxy, rect: Rect?) {
        pigeon_instance.setCropRect(rect)
    }

    class PlaneProxyImpl(impl: CameraXImpl) : PigeonApiPlaneProxyApi(impl) {
        override fun buffer(pigeon_instance: ImageProxy.PlaneProxy): ByteBuffer {
            return  pigeon_instance.buffer
        }

        override fun pixelStride(pigeon_instance: ImageProxy.PlaneProxy): Long {
            return pigeon_instance.pixelStride.toLong()
        }

        override fun rowStride(pigeon_instance: ImageProxy.PlaneProxy): Long {
            return pigeon_instance.rowStride.toLong()
        }
    }
}
