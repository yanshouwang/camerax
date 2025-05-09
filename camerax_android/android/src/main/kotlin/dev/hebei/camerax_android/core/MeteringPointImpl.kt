package dev.hebei.camerax_android.core

import dev.hebei.camerax_android.CameraXRegistrar
import dev.hebei.camerax_android.PigeonApiMeteringPointApi

class MeteringPointImpl(registrar: CameraXRegistrar) : PigeonApiMeteringPointApi(registrar) {
    override fun size(pigeon_instance: androidx.camera.core.MeteringPoint): Double {
        return pigeon_instance.size.toDouble()
    }
}