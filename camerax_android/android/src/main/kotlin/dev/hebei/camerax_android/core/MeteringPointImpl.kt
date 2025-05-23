package dev.hebei.camerax_android.core

import androidx.camera.core.MeteringPoint
import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.PigeonApiMeteringPointApi

class MeteringPointImpl(impl: CameraXImpl) : PigeonApiMeteringPointApi(impl) {
    override fun size(pigeon_instance: MeteringPoint): Double {
        return pigeon_instance.size.toDouble()
    }
}