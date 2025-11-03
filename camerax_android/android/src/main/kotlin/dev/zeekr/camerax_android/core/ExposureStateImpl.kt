package dev.zeekr.camerax_android.core

import androidx.camera.core.ExposureState
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiExposureStateApi
import dev.zeekr.camerax_android.common.IntRange

class ExposureStateImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiExposureStateApi(registrar) {
    override fun exposureCompensationIndex(pigeon_instance: ExposureState): Long {
        return pigeon_instance.exposureCompensationIndex.toLong()
    }

    override fun exposureCompensationRange(pigeon_instance: ExposureState): IntRange {
        return IntRange(pigeon_instance.exposureCompensationRange)
    }

    override fun exposureCompensationStep(pigeon_instance: ExposureState): Double {
        return pigeon_instance.exposureCompensationStep.toDouble()
    }

    override fun isExposureCompensationSupported(pigeon_instance: ExposureState): Boolean {
        return pigeon_instance.isExposureCompensationSupported
    }
}