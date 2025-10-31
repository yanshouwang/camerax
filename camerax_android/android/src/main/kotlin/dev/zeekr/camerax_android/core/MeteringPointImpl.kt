package dev.zeekr.camerax_android.core

import androidx.camera.core.MeteringPoint
import dev.zeekr.camerax_android.CameraXRegistrarImpl
import dev.zeekr.camerax_android.PigeonApiMeteringPointApi

class MeteringPointImpl(impl: CameraXRegistrarImpl) : PigeonApiMeteringPointApi(impl) {
    override fun size(pigeon_instance: MeteringPoint): Double {
        return pigeon_instance.size.toDouble()
    }
}