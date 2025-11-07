package dev.zeekr.camerax_android.core

import android.graphics.Bitmap
import android.graphics.Rect
import androidx.camera.core.ImageInfo
import androidx.camera.core.ImageProxy
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.ImageFormatApi
import dev.zeekr.camerax_android.PigeonApiImageProxyPlaneProxyProxyApi
import dev.zeekr.camerax_android.PigeonApiImageProxyProxyApi
import dev.zeekr.camerax_android.common.imageFormatApi
import java.nio.ByteBuffer

class ImageProxyImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiImageProxyProxyApi(registrar) {
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
        val width = pigeon_instance.width
        val height = pigeon_instance.height
        return pigeon_instance.planes.map { SizedPlaneProxy(it, width, height) }
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

    override fun toBitmap(pigeon_instance: ImageProxy): Bitmap {
        return pigeon_instance.toBitmap()
    }

    class PlaneProxyImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
        PigeonApiImageProxyPlaneProxyProxyApi(registrar) {
        override fun value(pigeon_instance: ImageProxy.PlaneProxy): ByteArray {
            if (pigeon_instance !is SizedPlaneProxy) throw TypeCastException()
            return pigeon_instance.value
        }

        override fun pixelStride(pigeon_instance: ImageProxy.PlaneProxy): Long {
            if (pigeon_instance !is SizedPlaneProxy) throw TypeCastException()
            return pigeon_instance.pixelStride.toLong()
        }

        override fun rowStride(pigeon_instance: ImageProxy.PlaneProxy): Long {
            if (pigeon_instance !is SizedPlaneProxy) throw TypeCastException()
            return pigeon_instance.rowStride.toLong()
        }
    }

    class SizedPlaneProxy(private val plane: ImageProxy.PlaneProxy, private val width: Int, private val height: Int) :
        ImageProxy.PlaneProxy {
        override fun getPixelStride(): Int = plane.pixelStride

        override fun getRowStride(): Int = width * plane.pixelStride

        override fun getBuffer(): ByteBuffer = plane.buffer

        val value: ByteArray
            get() {
                val buffer = this.buffer
                val pixelStride = this.pixelStride
                val rowStride = this.rowStride
                // The pixel stride and row stride of JPEG is 0
                if (pixelStride == 0) {
                    val remaining = buffer.remaining()
                    val value = ByteArray(remaining)
                    buffer.get(value)
                    return value
                }
                // Remove the stride alignment
                val value = ByteArray(rowStride * height)
                if (rowStride == plane.rowStride) {
                    buffer.get(value)
                } else {
                    val emptyValue = ByteArray(plane.rowStride - rowStride)
                    for (row in 0 until height) {
                        buffer.get(value, row * rowStride, rowStride)
                        buffer.get(emptyValue)
                    }
                }
                return value
            }
    }
}
