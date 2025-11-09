package dev.zeekr.camerax_android.core

import android.os.Build
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiByteBufferProxyApi
import java.nio.ByteBuffer

class ByteBufferImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiByteBufferProxyApi(registrar) {
    override fun allocate(capacity: Long): ByteBuffer {
        return ByteBuffer.allocate(capacity.toInt())
    }

    override fun allocateDirect(capacity: Long): ByteBuffer {
        return ByteBuffer.allocateDirect(capacity.toInt())
    }

    override fun wrap1(array: ByteArray): ByteBuffer {
        return ByteBuffer.wrap(array)
    }

    override fun wrap2(array: ByteArray, offset: Long, length: Long): ByteBuffer {
        return ByteBuffer.wrap(array, offset.toInt(), length.toInt())
    }

    override fun alignedSlice(pigeon_instance: ByteBuffer, unitSize: Long): ByteBuffer {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) pigeon_instance.alignedSlice(unitSize.toInt())
        else throw UnsupportedOperationException("Call requires API level 33")
    }

    override fun alignmentOffset(pigeon_instance: ByteBuffer, index: Long, unitSize: Long): Long {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            pigeon_instance.alignmentOffset(index.toInt(), unitSize.toInt()).toLong()
        } else {
            throw UnsupportedOperationException("Call requires API level 33")
        }
    }

    override fun array(pigeon_instance: ByteBuffer): ByteArray {
        return pigeon_instance.array()
    }

    override fun asReadOnlyBuffer(pigeon_instance: ByteBuffer): ByteBuffer {
        return pigeon_instance.asReadOnlyBuffer()
    }

    override fun compact(pigeon_instance: ByteBuffer): ByteBuffer {
        return pigeon_instance.compact()
    }

    override fun compareTo(pigeon_instance: ByteBuffer, that: ByteBuffer): Long {
        return pigeon_instance.compareTo(that).toLong()
    }

    override fun duplicate(pigeon_instance: ByteBuffer): ByteBuffer {
        return pigeon_instance.duplicate()
    }

    override fun get1(pigeon_instance: ByteBuffer): Long {
        return pigeon_instance.get().toLong()
    }

    override fun get2(pigeon_instance: ByteBuffer, index: Long): Long {
        return pigeon_instance.get(index.toInt()).toLong()
    }

    override fun get3(pigeon_instance: ByteBuffer, dst: ByteArray): ByteBuffer {
        return pigeon_instance.get(dst)
    }

    override fun get4(pigeon_instance: ByteBuffer, index: Long, dst: ByteArray): ByteBuffer {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.VANILLA_ICE_CREAM) {
            pigeon_instance.get(index.toInt(), dst)
        } else {
            throw UnsupportedOperationException("Call requires API level 35")
        }
    }

    override fun get5(pigeon_instance: ByteBuffer, dst: ByteArray, offset: Long, length: Long): ByteBuffer {
        return pigeon_instance.get(dst, offset.toInt(), length.toInt())
    }

    override fun get6(
        pigeon_instance: ByteBuffer, index: Long, dst: ByteArray, offset: Long, length: Long
    ): ByteBuffer {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.VANILLA_ICE_CREAM) {
            pigeon_instance.get(index.toInt(), dst, offset.toInt(), length.toInt())
        } else {
            throw UnsupportedOperationException("Call requires API level 35")
        }
    }

    override fun getDouble1(pigeon_instance: ByteBuffer): Double {
        return pigeon_instance.getDouble()
    }

    override fun getDouble2(pigeon_instance: ByteBuffer, index: Long): Double {
        return pigeon_instance.getDouble(index.toInt())
    }

    override fun getFloat1(pigeon_instance: ByteBuffer): Double {
        return pigeon_instance.getFloat().toDouble()
    }

    override fun getFloat2(pigeon_instance: ByteBuffer, index: Long): Double {
        return pigeon_instance.getFloat(index.toInt()).toDouble()
    }

    override fun getInt1(pigeon_instance: ByteBuffer): Long {
        return pigeon_instance.getInt().toLong()
    }

    override fun getInt2(pigeon_instance: ByteBuffer, index: Long): Long {
        return pigeon_instance.getInt(index.toInt()).toLong()
    }

    override fun getLong1(pigeon_instance: ByteBuffer): Long {
        return pigeon_instance.getLong()
    }

    override fun getLong2(pigeon_instance: ByteBuffer, index: Long): Long {
        return pigeon_instance.getLong(index.toInt())
    }

    override fun getShort1(pigeon_instance: ByteBuffer): Long {
        return pigeon_instance.getShort().toLong()
    }

    override fun getShort2(pigeon_instance: ByteBuffer, index: Long): Long {
        return pigeon_instance.getShort(index.toInt()).toLong()
    }

    override fun mismatch(pigeon_instance: ByteBuffer, that: ByteBuffer): Long {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE) {
            pigeon_instance.mismatch(that).toLong()
        } else {
            throw UnsupportedOperationException("Call requires API level 34")
        }
    }

    override fun put1(pigeon_instance: ByteBuffer, b: Long): ByteBuffer {
        return pigeon_instance.put(b.toByte())
    }

    override fun put2(pigeon_instance: ByteBuffer, index: Long, b: Long): ByteBuffer {
        return pigeon_instance.put(index.toInt(), b.toByte())
    }

    override fun put3(pigeon_instance: ByteBuffer, src: ByteArray): ByteBuffer {
        return pigeon_instance.put(src)
    }

    override fun put4(pigeon_instance: ByteBuffer, index: Long, src: ByteArray): ByteBuffer {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.VANILLA_ICE_CREAM) {
            pigeon_instance.put(index.toInt(), src)
        } else {
            throw UnsupportedOperationException("Call requires API level 35")
        }
    }

    override fun put5(pigeon_instance: ByteBuffer, src: ByteArray, offset: Long, length: Long): ByteBuffer {
        return pigeon_instance.put(src, offset.toInt(), length.toInt())
    }

    override fun put6(
        pigeon_instance: ByteBuffer, index: Long, src: ByteArray, offset: Long, length: Long
    ): ByteBuffer {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.VANILLA_ICE_CREAM) {
            pigeon_instance.put(index.toInt(), src, offset.toInt(), length.toInt())
        } else {
            throw UnsupportedOperationException("Call requires API level 35")
        }
    }

    override fun put7(pigeon_instance: ByteBuffer, src: ByteBuffer): ByteBuffer {
        return pigeon_instance.put(src)
    }

    override fun put8(
        pigeon_instance: ByteBuffer, index: Long, src: ByteBuffer, offset: Long, length: Long
    ): ByteBuffer {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.VANILLA_ICE_CREAM) {
            pigeon_instance.put(index.toInt(), src, offset.toInt(), length.toInt())
        } else {
            throw UnsupportedOperationException("Call requires API level 35")
        }
    }

    override fun putDouble1(pigeon_instance: ByteBuffer, value: Double): ByteBuffer {
        return pigeon_instance.putDouble(value)
    }

    override fun putDouble2(pigeon_instance: ByteBuffer, index: Long, value: Double): ByteBuffer {
        return pigeon_instance.putDouble(index.toInt(), value)
    }

    override fun putFloat1(pigeon_instance: ByteBuffer, value: Double): ByteBuffer {
        return pigeon_instance.putFloat(value.toFloat())
    }

    override fun putFloat2(pigeon_instance: ByteBuffer, index: Long, value: Double): ByteBuffer {
        return pigeon_instance.putFloat(index.toInt(), value.toFloat())
    }

    override fun putInt1(pigeon_instance: ByteBuffer, value: Long): ByteBuffer {
        return pigeon_instance.putInt(value.toInt())
    }

    override fun putInt2(pigeon_instance: ByteBuffer, index: Long, value: Long): ByteBuffer {
        return pigeon_instance.putInt(index.toInt(), value.toInt())
    }

    override fun putLong1(pigeon_instance: ByteBuffer, value: Long): ByteBuffer {
        return pigeon_instance.putLong(value)
    }

    override fun putLong2(pigeon_instance: ByteBuffer, index: Long, value: Long): ByteBuffer {
        return pigeon_instance.putLong(index.toInt(), value)
    }

    override fun putShort1(pigeon_instance: ByteBuffer, value: Long): ByteBuffer {
        return pigeon_instance.putShort(value.toShort())
    }

    override fun putShort2(pigeon_instance: ByteBuffer, index: Long, value: Long): ByteBuffer {
        return pigeon_instance.putShort(index.toInt(), value.toShort())
    }

    override fun slice1(pigeon_instance: ByteBuffer): ByteBuffer {
        return pigeon_instance.slice()
    }

    override fun slice2(pigeon_instance: ByteBuffer, index: Long, length: Long): ByteBuffer {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE) {
            pigeon_instance.slice(index.toInt(), length.toInt())
        } else {
            throw UnsupportedOperationException("Call requires API level 34")
        }
    }
}