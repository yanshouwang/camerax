package dev.hebei.camerax_android.legacy.core

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.common.IntRange
import dev.hebei.camerax_android.legacy.PigeonApiExposureState

class ExposureState(registrar: CameraXRegistrar) : PigeonApiExposureState(registrar) {
    override fun exposureCompensationIndex(pigeon_instance: androidx.camera.core.ExposureState): Long {
        return pigeon_instance.exposureCompensationIndex.toLong()
    }

    override fun exposureCompensationRange(pigeon_instance: androidx.camera.core.ExposureState): IntRange.Stub {
        val obj = pigeon_instance.exposureCompensationRange
        return IntRange.Stub(obj)
    }

    override fun exposureCompensationStep(pigeon_instance: androidx.camera.core.ExposureState): Double {
        return pigeon_instance.exposureCompensationStep.toDouble()
    }

    override fun isExposureCompensationSupported(pigeon_instance: androidx.camera.core.ExposureState): Boolean {
        return pigeon_instance.isExposureCompensationSupported
    }
}