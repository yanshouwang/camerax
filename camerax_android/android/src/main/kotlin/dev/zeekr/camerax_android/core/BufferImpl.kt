package dev.zeekr.camerax_android.core

import android.os.Build
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiBufferProxyApi
import java.nio.Buffer

class BufferImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiBufferProxyApi(registrar) {
    override fun arrayOffset(pigeon_instance: Buffer): Long {
        return pigeon_instance.arrayOffset().toLong()
    }

    override fun capacity(pigeon_instance: Buffer): Long {
        return pigeon_instance.capacity().toLong()
    }

    override fun clear(pigeon_instance: Buffer): Buffer {
        return pigeon_instance.clear()
    }

    override fun duplicate(pigeon_instance: Buffer): Buffer {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE) pigeon_instance.duplicate()
        else throw UnsupportedOperationException("Call requires API level 34")
    }

    override fun flip(pigeon_instance: Buffer): Buffer {
        return pigeon_instance.flip()
    }

    override fun hasArray(pigeon_instance: Buffer): Boolean {
        return pigeon_instance.hasArray()
    }

    override fun hasRemaining(pigeon_instance: Buffer): Boolean {
        return pigeon_instance.hasRemaining()
    }

    override fun isDirect(pigeon_instance: Buffer): Boolean {
        return pigeon_instance.isDirect
    }

    override fun isReadOnly(pigeon_instance: Buffer): Boolean {
        return pigeon_instance.isReadOnly
    }

    override fun limit1(pigeon_instance: Buffer): Long {
        return pigeon_instance.limit().toLong()
    }

    override fun limit2(pigeon_instance: Buffer, newLimit: Long): Buffer {
        return pigeon_instance.limit(newLimit.toInt())
    }

    override fun mark(pigeon_instance: Buffer): Buffer {
        return pigeon_instance.mark()
    }

    override fun position1(pigeon_instance: Buffer): Long {
        return pigeon_instance.position().toLong()
    }

    override fun position2(pigeon_instance: Buffer, newPosition: Long): Buffer {
        return pigeon_instance.position(newPosition.toInt())
    }

    override fun remaining(pigeon_instance: Buffer): Long {
        return pigeon_instance.remaining().toLong()
    }

    override fun reset(pigeon_instance: Buffer): Buffer {
        return pigeon_instance.reset()
    }

    override fun rewind(pigeon_instance: Buffer): Buffer {
        return pigeon_instance.rewind()
    }

    override fun slice1(pigeon_instance: Buffer): Buffer {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE) pigeon_instance.slice()
        else throw UnsupportedOperationException("Call requires API level 34")
    }

    override fun slice2(pigeon_instance: Buffer, index: Long, length: Long): Buffer {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE) {
            pigeon_instance.slice(index.toInt(), length.toInt())
        } else {
            throw UnsupportedOperationException("Call requires API level 34")
        }
    }
}