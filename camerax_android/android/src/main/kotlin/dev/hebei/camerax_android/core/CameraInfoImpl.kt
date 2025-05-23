package dev.hebei.camerax_android.core

import androidx.camera.core.CameraInfo
import androidx.camera.core.CameraSelector
import androidx.camera.core.DynamicRange
import androidx.camera.core.ExposureState
import androidx.camera.core.FocusMeteringAction
import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.LensFacingApi
import dev.hebei.camerax_android.PigeonApiCameraInfoApi
import dev.hebei.camerax_android.common.CameraStateLiveData
import dev.hebei.camerax_android.common.IntRange
import dev.hebei.camerax_android.common.TorchStateLiveData
import dev.hebei.camerax_android.common.ZoomStateLiveData

class CameraInfoImpl(impl: CameraXImpl) : PigeonApiCameraInfoApi(impl) {
    override fun mustPlayShutterSound(): Boolean {
        return CameraInfo.mustPlayShutterSound()
    }

    override fun getCameraSelector(pigeon_instance: CameraInfo): CameraSelector {
        return pigeon_instance.cameraSelector
    }

    override fun getCameraState(pigeon_instance: CameraInfo): CameraStateLiveData {
        return CameraStateLiveData(pigeon_instance.cameraState)
    }

    override fun getTorchState(pigeon_instance: CameraInfo): TorchStateLiveData {
        return TorchStateLiveData(pigeon_instance.torchState)
    }

    override fun getZoomState(pigeon_instance: CameraInfo): ZoomStateLiveData {
        return ZoomStateLiveData(pigeon_instance.zoomState)
    }

    override fun getExposureState(pigeon_instance: CameraInfo): ExposureState {
        return pigeon_instance.exposureState
    }

    override fun getIntrinsticZoomRatio(pigeon_instance: CameraInfo): Double {
        return pigeon_instance.intrinsicZoomRatio.toDouble()
    }

    override fun getLensFacing(pigeon_instance: CameraInfo): LensFacingApi {
        return pigeon_instance.lensFacing.lensFacingApi
    }

    override fun getPhysicalCameraInfos(pigeon_instance: CameraInfo): List<CameraInfo> {
        return pigeon_instance.physicalCameraInfos.toList()
    }

    override fun getSensorRotationDegrees(pigeon_instance: CameraInfo): Long {
        return pigeon_instance.sensorRotationDegrees.toLong()
    }

    override fun getSupportedFrameRateRanges(pigeon_instance: CameraInfo): List<IntRange> {
        return pigeon_instance.supportedFrameRateRanges.map { obj -> IntRange(obj) }
    }

    override fun isLogicalMultiCameraSupported(pigeon_instance: CameraInfo): Boolean {
        return pigeon_instance.isLogicalMultiCameraSupported
    }

    override fun isZslSupported(pigeon_instance: CameraInfo): Boolean {
        return pigeon_instance.isZslSupported
    }

    override fun hasFlashUnit(pigeon_instance: CameraInfo): Boolean {
        return pigeon_instance.hasFlashUnit()
    }

    override fun isFocusMeteringSupported(pigeon_instance: CameraInfo, action: FocusMeteringAction): Boolean {
        return pigeon_instance.isFocusMeteringSupported(action)
    }

    override fun querySupportedDynamicRanges(
        pigeon_instance: CameraInfo, candidateDynamicRanges: List<DynamicRange>
    ): List<DynamicRange> {
        return pigeon_instance.querySupportedDynamicRanges(candidateDynamicRanges.toSet()).toList()
    }
}