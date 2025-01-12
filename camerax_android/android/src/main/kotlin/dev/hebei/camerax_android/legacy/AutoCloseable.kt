package dev.hebei.camerax_android.legacy

class AutoCloseable(registrar: CameraXRegistrar) : PigeonApiAutoCloseable(registrar) {
    override fun close(pigeon_instance: java.lang.AutoCloseable) {
        pigeon_instance.close()
    }
}