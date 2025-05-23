package dev.hebei.camerax_android.common

import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.PigeonApiBufferApi
import java.nio.Buffer

class BufferImpl(impl: CameraXImpl): PigeonApiBufferApi(impl) {
    override fun remaining(pigeon_instance: Buffer): Long {
        return pigeon_instance.remaining().toLong()
    }
}