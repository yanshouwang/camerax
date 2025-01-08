package dev.hebei.camerax_android.legacy.core

import androidx.lifecycle.map
import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.LensFacing
import dev.hebei.camerax_android.legacy.PigeonApiCameraInfo

class CameraInfo(registrar: CameraXRegistrar) : PigeonApiCameraInfo(registrar) {
    override fun mustPlayShutterSound(): Boolean {
        return dev.hebei.camerax_android.core.CameraInfo.mustPlayShutterSound()
    }

    override fun getCameraSelector(pigeon_instance: dev.hebei.camerax_android.core.CameraInfo): dev.hebei.camerax_android.core.CameraSelector {
        return pigeon_instance.cameraSelector
    }

    override fun getCameraState(pigeon_instance: dev.hebei.camerax_android.core.CameraInfo): CameraStateLiveData.Wrapper {
        val obj = pigeon_instance.cameraState.map { state -> state.args }
        return CameraStateLiveData.Wrapper(obj)

    }

    override fun getTorchState(pigeon_instance: dev.hebei.camerax_android.core.CameraInfo): TorchStateLiveData.Wrapper {
        val obj = pigeon_instance.torchState
        return TorchStateLiveData.Wrapper(obj)
    }

    override fun getZoomState(pigeon_instance: dev.hebei.camerax_android.core.CameraInfo): ZoomStateLiveData.Wrapper {
        val obj = pigeon_instance.zoomState
        return ZoomStateLiveData.Wrapper(obj)
    }

    override fun getExposureState(pigeon_instance: dev.hebei.camerax_android.core.CameraInfo): dev.hebei.camerax_android.core.ExposureState {
        return pigeon_instance.exposureState
    }

    override fun getIntrinsticZoomRatio(pigeon_instance: dev.hebei.camerax_android.core.CameraInfo): Double {
        return pigeon_instance.intrinsicZoomRatio.toDouble()
    }

    override fun getLensFacing(pigeon_instance: dev.hebei.camerax_android.core.CameraInfo): LensFacing {
        return pigeon_instance.lensFacing.args
    }

    override fun getPhysicalCameraInfos(pigeon_instance: dev.hebei.camerax_android.core.CameraInfo): List<dev.hebei.camerax_android.core.CameraInfo> {
        return pigeon_instance.physicalCameraInfos.toList()
    }

    override fun getSensorRotationDegrees(pigeon_instance: dev.hebei.camerax_android.core.CameraInfo): Long {
        return pigeon_instance.sensorRotationDegrees.toLong()
    }

    override fun getSupportedFrameRateRanges(pigeon_instance: dev.hebei.camerax_android.core.CameraInfo): List<IntRange.Wrapper> {
        return pigeon_instance.supportedFrameRateRanges.map { obj -> IntRange.Wrapper(obj) }
    }

    override fun isLogicalMultiCameraSupported(pigeon_instance: dev.hebei.camerax_android.core.CameraInfo): Boolean {
        return pigeon_instance.isLogicalMultiCameraSupported
    }

    override fun isZslSupported(pigeon_instance: dev.hebei.camerax_android.core.CameraInfo): Boolean {
        return pigeon_instance.isZslSupported
    }

    override fun hasFlashUnit(pigeon_instance: dev.hebei.camerax_android.core.CameraInfo): Boolean {
        return pigeon_instance.hasFlashUnit()
    }

    override fun isFocusMeteringSupported(
        pigeon_instance: dev.hebei.camerax_android.core.CameraInfo,
        action: dev.hebei.camerax_android.core.FocusMeteringAction
    ): Boolean {
        return pigeon_instance.isFocusMeteringSupported(action)
    }

    override fun querySupportedDynamicRanges(
        pigeon_instance: dev.hebei.camerax_android.core.CameraInfo,
        candidateDynamicRanges: List<dev.hebei.camerax_android.core.DynamicRange>
    ): List<dev.hebei.camerax_android.core.DynamicRange> {
        return pigeon_instance.querySupportedDynamicRanges(candidateDynamicRanges.toSet()).toList()
    }
}