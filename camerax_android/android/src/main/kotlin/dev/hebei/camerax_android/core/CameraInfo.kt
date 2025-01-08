package dev.hebei.camerax_android.core

import androidx.camera.core.ExperimentalZeroShutterLag
import androidx.lifecycle.map

class CameraInfo internal constructor(internal val obj: androidx.camera.core.CameraInfo) {
    companion object {
        fun mustPlayShutterSound(): Boolean {
            return androidx.camera.core.CameraInfo.mustPlayShutterSound()
        }
    }

    val cameraSelector get() = CameraSelector(obj.cameraSelector)
    val cameraState get() = obj.cameraState.map { obj -> obj.args }
    val torchState get() = obj.torchState.map { obj -> obj.torchStateArgs }
    val zoomState get() = obj.zoomState.map { obj -> ZoomState(obj) }
    val exposureState get() = ExposureState(obj.exposureState)
    val intrinsicZoomRatio get() = obj.intrinsicZoomRatio
    val lensFacing get() = obj.lensFacing.lensFacingArgs
    val physicalCameraInfos get() = obj.physicalCameraInfos.map { obj -> CameraInfo(obj) }.toSet()
    val sensorRotationDegrees get() = obj.sensorRotationDegrees
    val supportedFrameRateRanges get() = obj.supportedFrameRateRanges.toSet()
    val isLogicalMultiCameraSupported get() = obj.isLogicalMultiCameraSupported
    val isZslSupported
        @ExperimentalZeroShutterLag get() = obj.isZslSupported

    fun hasFlashUnit(): Boolean {
        return obj.hasFlashUnit()
    }

    fun isFocusMeteringSupported(action: FocusMeteringAction): Boolean {
        return obj.isFocusMeteringSupported(action.obj)
    }

    fun querySupportedDynamicRanges(candidateDynamicRanges: Set<DynamicRange>): Set<DynamicRange> {
        val candidateObjs = candidateDynamicRanges.map { range -> range.obj }.toSet()
        val objs = obj.querySupportedDynamicRanges(candidateObjs)
        return candidateDynamicRanges.filter { range -> objs.contains(range.obj) }.toSet()
    }
}