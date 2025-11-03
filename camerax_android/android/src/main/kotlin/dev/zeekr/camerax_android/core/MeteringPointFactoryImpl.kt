package dev.zeekr.camerax_android.core

import androidx.camera.core.MeteringPoint
import androidx.camera.core.MeteringPointFactory
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiMeteringPointFactoryApi

class MeteringPointFactoryImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiMeteringPointFactoryApi(registrar) {
    override fun createPoint(
        pigeon_instance: MeteringPointFactory,
        x: Double,
        y: Double,
        size: Double?
    ): MeteringPoint {
        return if (size == null) pigeon_instance.createPoint(x.toFloat(), y.toFloat())
        else pigeon_instance.createPoint(x.toFloat(), y.toFloat(), size.toFloat())
    }
}