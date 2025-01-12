package dev.hebei.camerax_android.legacy.core

import androidx.lifecycle.map
import dev.hebei.camerax_android.legacy.*
import dev.hebei.camerax_android.legacy.IntRange

class CameraInfo(registrar: CameraXRegistrar) : PigeonApiCameraInfo(registrar) {
    override fun mustPlayShutterSound(): Boolean {
        return androidx.camera.core.CameraInfo.mustPlayShutterSound()
    }

    override fun getCameraSelector(pigeon_instance: androidx.camera.core.CameraInfo): androidx.camera.core.CameraSelector {
        return pigeon_instance.cameraSelector
    }

    override fun getCameraState(pigeon_instance: androidx.camera.core.CameraInfo): CameraStateLiveData.Stub {
        val obj = pigeon_instance.cameraState.map { state -> state.args }
        return CameraStateLiveData.Stub(obj)

    }

    override fun getTorchState(pigeon_instance: androidx.camera.core.CameraInfo): TorchStateLiveData.Stub {
        val obj = pigeon_instance.torchState.map { state -> state.torchStateArgs }
        return TorchStateLiveData.Stub(obj)
    }

    override fun getZoomState(pigeon_instance: androidx.camera.core.CameraInfo): ZoomStateLiveData.Stub {
        val obj = pigeon_instance.zoomState
        return ZoomStateLiveData.Stub(obj)
    }

    override fun getExposureState(pigeon_instance: androidx.camera.core.CameraInfo): androidx.camera.core.ExposureState {
        return pigeon_instance.exposureState
    }

    override fun getIntrinsticZoomRatio(pigeon_instance: androidx.camera.core.CameraInfo): Double {
        return pigeon_instance.intrinsicZoomRatio.toDouble()
    }

    override fun getLensFacing(pigeon_instance: androidx.camera.core.CameraInfo): LensFacing {
        return pigeon_instance.lensFacing.lensFacingArgs
    }

    override fun getPhysicalCameraInfos(pigeon_instance: androidx.camera.core.CameraInfo): List<androidx.camera.core.CameraInfo> {
        return pigeon_instance.physicalCameraInfos.toList()
    }

    override fun getSensorRotationDegrees(pigeon_instance: androidx.camera.core.CameraInfo): Long {
        return pigeon_instance.sensorRotationDegrees.toLong()
    }

    override fun getSupportedFrameRateRanges(pigeon_instance: androidx.camera.core.CameraInfo): List<IntRange.Stub> {
        return pigeon_instance.supportedFrameRateRanges.map { obj -> IntRange.Stub(obj) }
    }

    override fun isLogicalMultiCameraSupported(pigeon_instance: androidx.camera.core.CameraInfo): Boolean {
        return pigeon_instance.isLogicalMultiCameraSupported
    }

    override fun isZslSupported(pigeon_instance: androidx.camera.core.CameraInfo): Boolean {
        return pigeon_instance.isZslSupported
    }

    override fun hasFlashUnit(pigeon_instance: androidx.camera.core.CameraInfo): Boolean {
        return pigeon_instance.hasFlashUnit()
    }

    override fun isFocusMeteringSupported(
        pigeon_instance: androidx.camera.core.CameraInfo, action: androidx.camera.core.FocusMeteringAction
    ): Boolean {
        return pigeon_instance.isFocusMeteringSupported(action)
    }

    override fun querySupportedDynamicRanges(
        pigeon_instance: androidx.camera.core.CameraInfo,
        candidateDynamicRanges: List<androidx.camera.core.DynamicRange>
    ): List<androidx.camera.core.DynamicRange> {
        return pigeon_instance.querySupportedDynamicRanges(candidateDynamicRanges.toSet()).toList()
    }
}