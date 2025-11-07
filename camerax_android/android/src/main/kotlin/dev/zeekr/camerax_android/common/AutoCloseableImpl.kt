package dev.zeekr.camerax_android.common

import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiAutoCloseableProxyApi
import java.lang.AutoCloseable

class AutoCloseableImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiAutoCloseableProxyApi(registrar) {
    override fun close(pigeon_instance: AutoCloseable) {
        pigeon_instance.close()
    }
}