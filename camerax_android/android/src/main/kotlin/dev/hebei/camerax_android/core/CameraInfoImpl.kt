package dev.hebei.camerax_android.core

import androidx.lifecycle.map
import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.LensFacingApi
import dev.hebei.camerax_android.PigeonApiCameraInfoApi
import dev.hebei.camerax_android.common.CameraStateLiveData
import dev.hebei.camerax_android.common.IntRange
import dev.hebei.camerax_android.common.TorchStateLiveData
import dev.hebei.camerax_android.common.ZoomStateLiveData

class CameraInfoImpl(impl: CameraXImpl) : PigeonApiCameraInfoApi(impl) {
    override fun mustPlayShutterSound(): Boolean {
        return androidx.camera.core.CameraInfo.mustPlayShutterSound()
    }

    override fun getCameraSelector(pigeon_instance: androidx.camera.core.CameraInfo): androidx.camera.core.CameraSelector {
        return pigeon_instance.cameraSelector
    }

    override fun getCameraState(pigeon_instance: androidx.camera.core.CameraInfo): CameraStateLiveData {
        val obj = pigeon_instance.cameraState.map { state -> state.api }
        return CameraStateLiveData(obj)
    }

    override fun getTorchState(pigeon_instance: androidx.camera.core.CameraInfo): TorchStateLiveData {
        val obj = pigeon_instance.torchState.map { state -> state.torchStateApi }
        return TorchStateLiveData(obj)
    }

    override fun getZoomState(pigeon_instance: androidx.camera.core.CameraInfo): ZoomStateLiveData {
        val obj = pigeon_instance.zoomState
        return ZoomStateLiveData(obj)
    }

    override fun getExposureState(pigeon_instance: androidx.camera.core.CameraInfo): androidx.camera.core.ExposureState {
        return pigeon_instance.exposureState
    }

    override fun getIntrinsticZoomRatio(pigeon_instance: androidx.camera.core.CameraInfo): Double {
        return pigeon_instance.intrinsicZoomRatio.toDouble()
    }

    override fun getLensFacing(pigeon_instance: androidx.camera.core.CameraInfo): LensFacingApi {
        return pigeon_instance.lensFacing.lensFacingApi
    }

    override fun getPhysicalCameraInfos(pigeon_instance: androidx.camera.core.CameraInfo): List<androidx.camera.core.CameraInfo> {
        return pigeon_instance.physicalCameraInfos.toList()
    }

    override fun getSensorRotationDegrees(pigeon_instance: androidx.camera.core.CameraInfo): Long {
        return pigeon_instance.sensorRotationDegrees.toLong()
    }

    override fun getSupportedFrameRateRanges(pigeon_instance: androidx.camera.core.CameraInfo): List<IntRange> {
        return pigeon_instance.supportedFrameRateRanges.map { obj -> IntRange(obj) }
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