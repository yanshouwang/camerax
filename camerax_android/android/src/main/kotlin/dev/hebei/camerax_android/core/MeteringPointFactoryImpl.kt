package dev.hebei.camerax_android.core

import dev.hebei.camerax_android.CameraXRegistrar
import dev.hebei.camerax_android.PigeonApiMeteringPointFactoryApi

class MeteringPointFactoryImpl(registrar: CameraXRegistrar) : PigeonApiMeteringPointFactoryApi(registrar) {
    override fun createPoint(
        pigeon_instance: androidx.camera.core.MeteringPointFactory, x: Double, y: Double, size: Double?
    ): androidx.camera.core.MeteringPoint {
        return if (size == null) pigeon_instance.createPoint(x.toFloat(), y.toFloat())
        else pigeon_instance.createPoint(x.toFloat(), y.toFloat(), size.toFloat())
    }
}