package dev.zeekr.camerax_android.core

import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiByteArrayOutputStreamProxyApi
import java.io.ByteArrayOutputStream
import java.io.OutputStream

class ByteArrayOutputStreamImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiByteArrayOutputStreamProxyApi(registrar) {
    override fun pigeon_defaultConstructor(): ByteArrayOutputStream {
        return ByteArrayOutputStream()
    }

    override fun size(size: Long): ByteArrayOutputStream {
        return ByteArrayOutputStream(size.toInt())
    }

    override fun reset(pigeon_instance: ByteArrayOutputStream) {
        return pigeon_instance.reset()
    }

    override fun size(pigeon_instance: ByteArrayOutputStream): Long {
        return pigeon_instance.size().toLong()
    }

    override fun toByteArray(pigeon_instance: ByteArrayOutputStream): ByteArray {
        return pigeon_instance.toByteArray()
    }

    override fun toString1(pigeon_instance: ByteArrayOutputStream): String {
        return pigeon_instance.toString()
    }

    override fun toString2(pigeon_instance: ByteArrayOutputStream, charsetName: String): String {
        return pigeon_instance.toString(charsetName)
    }

    override fun toString4(pigeon_instance: ByteArrayOutputStream, hibyte: Long): String {
        return pigeon_instance.toString(hibyte.toInt())
    }

    override fun writeBytes(pigeon_instance: ByteArrayOutputStream, b: ByteArray) {
        return pigeon_instance.writeBytes(b)
    }

    override fun writeTo(pigeon_instance: ByteArrayOutputStream, out: OutputStream) {
        return pigeon_instance.writeTo(out)
    }
}