package dev.zeekr.camerax_android.common

import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiAutoCloseableApi
import java.lang.AutoCloseable

class AutoCloseableImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiAutoCloseableApi(registrar) {
    override fun close(pigeon_instance: AutoCloseable) {
        pigeon_instance.close()
    }
}