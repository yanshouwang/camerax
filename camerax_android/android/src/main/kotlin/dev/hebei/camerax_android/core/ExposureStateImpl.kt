package dev.hebei.camerax_android.core

import androidx.camera.core.ExposureState
import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.common.IntRange
import dev.hebei.camerax_android.PigeonApiExposureStateApi

class ExposureStateImpl(impl: CameraXImpl) : PigeonApiExposureStateApi(impl) {
    override fun exposureCompensationIndex(pigeon_instance: ExposureState): Long {
        return pigeon_instance.exposureCompensationIndex.toLong()
    }

    override fun exposureCompensationRange(pigeon_instance: ExposureState): IntRange {
        val obj = pigeon_instance.exposureCompensationRange
        return IntRange(obj)
    }

    override fun exposureCompensationStep(pigeon_instance: ExposureState): Double {
        return pigeon_instance.exposureCompensationStep.toDouble()
    }

    override fun isExposureCompensationSupported(pigeon_instance: ExposureState): Boolean {
        return pigeon_instance.isExposureCompensationSupported
    }
}