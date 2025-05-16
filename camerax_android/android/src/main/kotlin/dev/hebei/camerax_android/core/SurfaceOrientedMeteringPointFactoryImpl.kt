package dev.hebei.camerax_android.core

import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.PigeonApiSurfaceOrientedMeteringPointFactoryApi

class SurfaceOrientedMeteringPointFactoryImpl(impl: CameraXImpl) :
    PigeonApiSurfaceOrientedMeteringPointFactoryApi(impl) {
    override fun pigeon_defaultConstructor(
        width: Double, height: Double
    ): androidx.camera.core.SurfaceOrientedMeteringPointFactory {
        return androidx.camera.core.SurfaceOrientedMeteringPointFactory(width.toFloat(), height.toFloat())
    }
}