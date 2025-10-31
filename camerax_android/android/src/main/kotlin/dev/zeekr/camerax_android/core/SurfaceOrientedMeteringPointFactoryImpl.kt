package dev.zeekr.camerax_android.core

import androidx.camera.core.SurfaceOrientedMeteringPointFactory
import dev.zeekr.camerax_android.CameraXRegistrarImpl
import dev.zeekr.camerax_android.PigeonApiSurfaceOrientedMeteringPointFactoryApi

class SurfaceOrientedMeteringPointFactoryImpl(impl: CameraXRegistrarImpl) :
    PigeonApiSurfaceOrientedMeteringPointFactoryApi(impl) {
    override fun pigeon_defaultConstructor(width: Double, height: Double): SurfaceOrientedMeteringPointFactory {
        return SurfaceOrientedMeteringPointFactory(width.toFloat(), height.toFloat())
    }
}