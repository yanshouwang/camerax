package dev.hebei.camerax_android.legacy.core

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiSurfaceOrientedMeteringPointFactory

class SurfaceOrientedMeteringPointFactory(registrar: CameraXRegistrar) :
    PigeonApiSurfaceOrientedMeteringPointFactory(registrar) {
    override fun pigeon_defaultConstructor(
        width: Double, height: Double
    ): androidx.camera.core.SurfaceOrientedMeteringPointFactory {
        return androidx.camera.core.SurfaceOrientedMeteringPointFactory(width.toFloat(), height.toFloat())
    }
}