package dev.zeekr.camerax_android.core

import androidx.camera.core.SurfaceOrientedMeteringPointFactory
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiSurfaceOrientedMeteringPointFactoryApi

class SurfaceOrientedMeteringPointFactoryImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiSurfaceOrientedMeteringPointFactoryApi(registrar) {
    override fun pigeon_defaultConstructor(width: Double, height: Double): SurfaceOrientedMeteringPointFactory {
        return SurfaceOrientedMeteringPointFactory(width.toFloat(), height.toFloat())
    }
}