package dev.hebei.camerax_android.legacy.core

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiMeteringPoint

class MeteringPoint(registrar: CameraXRegistrar) : PigeonApiMeteringPoint(registrar) {
    override fun size(pigeon_instance: androidx.camera.core.MeteringPoint): Double {
        return pigeon_instance.size.toDouble()
    }
}