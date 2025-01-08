package dev.hebei.camerax_android.legacy.core

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiExposureState

class ExposureState(registrar: CameraXRegistrar) : PigeonApiExposureState(registrar) {
    override fun getExposureCompensationIndex(pigeon_instance: dev.hebei.camerax_android.core.ExposureState): Long {
        return pigeon_instance.exposureCompensationIndex.toLong()
    }

    override fun getExposureCompensationRange(pigeon_instance: dev.hebei.camerax_android.core.ExposureState): IntRange.Wrapper {
        val obj = pigeon_instance.exposureCompensationRange
        return IntRange.Wrapper(obj)
    }

    override fun getExposureCompensationStep(pigeon_instance: dev.hebei.camerax_android.core.ExposureState): Double {
        return pigeon_instance.exposureCompensationStep.toDouble()
    }

    override fun isExposureCompensationSupported(pigeon_instance: dev.hebei.camerax_android.core.ExposureState): Boolean {
        return pigeon_instance.isExposureCompensationSupported
    }
}