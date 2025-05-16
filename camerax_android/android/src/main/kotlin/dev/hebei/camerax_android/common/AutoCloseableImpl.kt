package dev.hebei.camerax_android.common

import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.PigeonApiAutoCloseableApi

class AutoCloseableImpl(impl: CameraXImpl) : PigeonApiAutoCloseableApi(impl) {
    override fun close(pigeon_instance: AutoCloseable) {
        pigeon_instance.close()
    }
}