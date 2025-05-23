package dev.hebei.camerax_android.common

import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.PigeonApiByteBufferApi
import java.nio.ByteBuffer

class ByteBufferImpl(impl: CameraXImpl) : PigeonApiByteBufferApi(impl) {
    override fun get(
        pigeon_instance: ByteBuffer, width: Long, height: Long, pixelStride: Long, rowStride: Long
    ): ByteArray {
        return pigeon_instance.get(width.toInt(), height.toInt(), pixelStride.toInt(), rowStride.toInt())
    }
}

fun ByteBuffer.get(width: Int, height: Int, pixelStride: Int, rowStride: Int): ByteArray {
    val rowSize = width * pixelStride
    if (rowSize == rowStride) {
        val remaining = this.remaining()
        val value = ByteArray(remaining)
        get(value)
        return value
    } else {
        val value = ByteArray(rowSize * height)
        val emptyValue = ByteArray(rowStride - rowSize)
        for (row in 0 until height) {
            val offset = row * width * pixelStride
            get(value, offset, rowSize)
            get(emptyValue)
        }
        return value
    }
}