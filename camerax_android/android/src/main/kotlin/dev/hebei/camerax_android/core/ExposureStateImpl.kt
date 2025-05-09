package dev.hebei.camerax_android.core

import dev.hebei.camerax_android.CameraXRegistrar
import dev.hebei.camerax_android.common.IntRange
import dev.hebei.camerax_android.PigeonApiExposureStateApi

class ExposureStateImpl(registrar: CameraXRegistrar) : PigeonApiExposureStateApi(registrar) {
    override fun exposureCompensationIndex(pigeon_instance: androidx.camera.core.ExposureState): Long {
        return pigeon_instance.exposureCompensationIndex.toLong()
    }

    override fun exposureCompensationRange(pigeon_instance: androidx.camera.core.ExposureState): IntRange {
        val obj = pigeon_instance.exposureCompensationRange
        return IntRange(obj)
    }

    override fun exposureCompensationStep(pigeon_instance: androidx.camera.core.ExposureState): Double {
        return pigeon_instance.exposureCompensationStep.toDouble()
    }

    override fun isExposureCompensationSupported(pigeon_instance: androidx.camera.core.ExposureState): Boolean {
        return pigeon_instance.isExposureCompensationSupported
    }
}