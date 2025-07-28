package dev.zeekr.camerax_android.common

import dev.zeekr.camerax_android.CameraXImpl
import dev.zeekr.camerax_android.PigeonApiAutoCloseableApi
import java.lang.AutoCloseable

class AutoCloseableImpl(impl: CameraXImpl) : PigeonApiAutoCloseableApi(impl) {
    override fun close(pigeon_instance: AutoCloseable) {
        pigeon_instance.close()
    }
}