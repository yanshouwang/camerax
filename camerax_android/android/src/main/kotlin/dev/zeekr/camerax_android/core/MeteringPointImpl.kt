package dev.zeekr.camerax_android.core

import androidx.camera.core.MeteringPoint
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiMeteringPointProxyApi

class MeteringPointImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiMeteringPointProxyApi(registrar) {
    override fun size(pigeon_instance: MeteringPoint): Double {
        return pigeon_instance.size.toDouble()
    }
}