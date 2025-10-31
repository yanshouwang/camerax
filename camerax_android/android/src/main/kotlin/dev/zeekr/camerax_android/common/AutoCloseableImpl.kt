package dev.zeekr.camerax_android.common

import dev.zeekr.camerax_android.CameraXRegistrarImpl
import dev.zeekr.camerax_android.PigeonApiAutoCloseableApi
import java.lang.AutoCloseable

class AutoCloseableImpl(impl: CameraXRegistrarImpl) : PigeonApiAutoCloseableApi(impl) {
    override fun close(pigeon_instance: AutoCloseable) {
        pigeon_instance.close()
    }
}