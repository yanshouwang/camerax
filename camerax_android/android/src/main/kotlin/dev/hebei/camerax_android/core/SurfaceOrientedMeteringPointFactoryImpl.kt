package dev.hebei.camerax_android.core

import dev.hebei.camerax_android.CameraXRegistrar
import dev.hebei.camerax_android.PigeonApiSurfaceOrientedMeteringPointFactoryApi

class SurfaceOrientedMeteringPointFactoryImpl(registrar: CameraXRegistrar) :
    PigeonApiSurfaceOrientedMeteringPointFactoryApi(registrar) {
    override fun pigeon_defaultConstructor(
        width: Double, height: Double
    ): androidx.camera.core.SurfaceOrientedMeteringPointFactory {
        return androidx.camera.core.SurfaceOrientedMeteringPointFactory(width.toFloat(), height.toFloat())
    }
}