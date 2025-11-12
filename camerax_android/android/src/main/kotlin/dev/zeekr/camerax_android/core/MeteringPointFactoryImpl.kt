package dev.zeekr.camerax_android.core

import androidx.camera.core.MeteringPoint
import androidx.camera.core.MeteringPointFactory
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiMeteringPointFactoryProxyApi

class MeteringPointFactoryImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiMeteringPointFactoryProxyApi(registrar) {
    override fun getDefaultPointSize(): Double {
        return MeteringPointFactory.getDefaultPointSize().toDouble()
    }

    override fun createPoint1(pigeon_instance: MeteringPointFactory, x: Double, y: Double): MeteringPoint {
        return pigeon_instance.createPoint(x.toFloat(), y.toFloat())
    }

    override fun createPoint2(
        pigeon_instance: MeteringPointFactory,
        x: Double,
        y: Double,
        size: Double
    ): MeteringPoint {
        return pigeon_instance.createPoint(x.toFloat(), y.toFloat(), size.toFloat())
    }
}