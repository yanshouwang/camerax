package dev.hebei.camerax_android.legacy.common

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiAutoCloseable

class AutoCloseable(registrar: CameraXRegistrar) : PigeonApiAutoCloseable(registrar) {
    override fun close(pigeon_instance: java.lang.AutoCloseable) {
        pigeon_instance.close()
    }
}