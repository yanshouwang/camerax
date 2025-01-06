package dev.hebei.camerax_android.core

class ExposureState internal constructor(internal val obj: androidx.camera.core.ExposureState) {
    val exposureCompensationIndex get() = obj.exposureCompensationIndex
    val exposureCompensationRange get() = obj.exposureCompensationRange
    val exposureCompensationStep get() = obj.exposureCompensationStep
    val isExposureCompensationSupported get() = obj.isExposureCompensationSupported
}