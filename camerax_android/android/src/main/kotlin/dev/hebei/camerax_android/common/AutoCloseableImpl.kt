package dev.hebei.camerax_android.common

import dev.hebei.camerax_android.CameraXRegistrar
import dev.hebei.camerax_android.PigeonApiAutoCloseableApi

class AutoCloseableImpl(registrar: CameraXRegistrar) : PigeonApiAutoCloseableApi(registrar) {
    override fun close(pigeon_instance: AutoCloseable) {
        pigeon_instance.close()
    }
}