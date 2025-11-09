package dev.zeekr.camerax_android.core

import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiNullOutputStreamProxyApi
import dev.zeekr.camerax_android.PigeonApiOutputStreamProxyApi
import java.io.OutputStream

class OutputStreamImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiOutputStreamProxyApi(registrar) {
    override fun close(pigeon_instance: OutputStream) {
        pigeon_instance.close()
    }

    override fun flush(pigeon_instance: OutputStream) {
        pigeon_instance.flush()
    }

    override fun write1(pigeon_instance: OutputStream, b: Long) {
        pigeon_instance.write(b.toInt())
    }

    override fun write2(pigeon_instance: OutputStream, b: ByteArray) {
        pigeon_instance.write(b)
    }

    override fun write3(pigeon_instance: OutputStream, b: ByteArray, off: Long, len: Long) {
        pigeon_instance.write(b, off.toInt(), len.toInt())
    }
}

class NullOutputStreamImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiNullOutputStreamProxyApi(registrar) {
    override fun pigeon_defaultConstructor(): OutputStream {
        return OutputStream.nullOutputStream()
    }
}