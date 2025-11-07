package dev.zeekr.camerax_android.core

import androidx.annotation.OptIn
import androidx.camera.core.CameraInfo
import androidx.camera.core.CameraSelector
import androidx.camera.core.DynamicRange
import androidx.camera.core.ExperimentalZeroShutterLag
import androidx.camera.core.ExposureState
import androidx.camera.core.FocusMeteringAction
import androidx.camera.core.ZoomState
import androidx.lifecycle.LifecycleOwner
import dev.zeekr.camerax_android.CameraSelectorLensFacingApi
import dev.zeekr.camerax_android.CameraStateApi
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.LowLightBoostStateApi
import dev.zeekr.camerax_android.PigeonApiCameraInfoProxyApi
import dev.zeekr.camerax_android.SurfaceRotationApi
import dev.zeekr.camerax_android.TorchStateApi
import dev.zeekr.camerax_android.activity
import dev.zeekr.camerax_android.common.CameraStateObserver
import dev.zeekr.camerax_android.common.IntObserver
import dev.zeekr.camerax_android.common.IntRange
import dev.zeekr.camerax_android.common.LowLightBoostStateObserver
import dev.zeekr.camerax_android.common.TorchStateObserver
import dev.zeekr.camerax_android.common.ZoomStateObserver
import dev.zeekr.camerax_android.common.impl

class CameraInfoImpl(private val registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiCameraInfoProxyApi(registrar) {
    override fun mustPlayShutterSound(): Boolean {
        return CameraInfo.mustPlayShutterSound()
    }

    override fun getCameraSelector(pigeon_instance: CameraInfo): CameraSelector {
        return pigeon_instance.cameraSelector
    }

    override fun getCameraState(pigeon_instance: CameraInfo): CameraStateApi? {
        return pigeon_instance.cameraState.value?.api
    }

    override fun observeCameraState(pigeon_instance: CameraInfo, observer: CameraStateObserver) {
        val owner = registrar.activity as LifecycleOwner
        pigeon_instance.cameraState.observe(owner, observer)
    }

    override fun removeCameraStateObserver(pigeon_instance: CameraInfo, observer: CameraStateObserver) {
        pigeon_instance.cameraState.removeObserver(observer)
    }

    override fun getTorchState(pigeon_instance: CameraInfo): TorchStateApi? {
        return pigeon_instance.torchState.value?.torchStateApi
    }

    override fun observeTorchState(pigeon_instance: CameraInfo, observer: TorchStateObserver) {
        val owner = registrar.activity as LifecycleOwner
        pigeon_instance.torchState.observe(owner, observer)
    }

    override fun removeTorchStateObserver(pigeon_instance: CameraInfo, observer: TorchStateObserver) {
        pigeon_instance.torchState.removeObserver(observer)
    }

    override fun getTorchStrengthLevel(pigeon_instance: CameraInfo): Long? {
        return pigeon_instance.torchStrengthLevel.value?.toLong()
    }

    override fun observeTorchStrengthLevel(pigeon_instance: CameraInfo, observer: IntObserver) {
        val owner = registrar.activity as LifecycleOwner
        pigeon_instance.torchStrengthLevel.observe(owner, observer)
    }

    override fun removeTorchStrengthLevelObserver(pigeon_instance: CameraInfo, observer: IntObserver) {
        pigeon_instance.torchStrengthLevel.removeObserver(observer)
    }

    override fun getZoomState(pigeon_instance: CameraInfo): ZoomState? {
        return pigeon_instance.zoomState.value
    }

    override fun observeZoomState(pigeon_instance: CameraInfo, observer: ZoomStateObserver) {
        val owner = registrar.activity as LifecycleOwner
        pigeon_instance.zoomState.observe(owner, observer)
    }

    override fun removeZoomStateObserver(pigeon_instance: CameraInfo, observer: ZoomStateObserver) {
        pigeon_instance.zoomState.removeObserver(observer)
    }

    override fun getExposureState(pigeon_instance: CameraInfo): ExposureState {
        return pigeon_instance.exposureState
    }

    override fun getIntrinsicZoomRatio(pigeon_instance: CameraInfo): Double {
        return pigeon_instance.intrinsicZoomRatio.toDouble()
    }

    override fun getLensFacing(pigeon_instance: CameraInfo): CameraSelectorLensFacingApi {
        return pigeon_instance.lensFacing.cameraSelectorLensFacingApi
    }

    override fun getLowLightBoostState(pigeon_instance: CameraInfo): LowLightBoostStateApi? {
        return pigeon_instance.lowLightBoostState.value?.lowLightBoostStateApi
    }

    override fun observeLowLightBoostState(pigeon_instance: CameraInfo, observer: LowLightBoostStateObserver) {
        val owner = registrar.activity as LifecycleOwner
        pigeon_instance.lowLightBoostState.observe(owner, observer)
    }

    override fun removeLowLightBoostStateObserver(pigeon_instance: CameraInfo, observer: LowLightBoostStateObserver) {
        pigeon_instance.lowLightBoostState.removeObserver(observer)
    }

    override fun getMaxTorchStrengthLevel(pigeon_instance: CameraInfo): Long {
        return pigeon_instance.maxTorchStrengthLevel.toLong()
    }

    override fun getPhysicalCameraInfos(pigeon_instance: CameraInfo): List<CameraInfo> {
        return pigeon_instance.physicalCameraInfos.toList()
    }

    override fun getSensorRotationDegrees1(pigeon_instance: CameraInfo): Long {
        return pigeon_instance.sensorRotationDegrees.toLong()
    }

    override fun getSensorRotationDegrees2(pigeon_instance: CameraInfo, relativeRotation: SurfaceRotationApi): Long {
        return pigeon_instance.getSensorRotationDegrees(relativeRotation.impl).toLong()
    }

    override fun getSupportedFrameRateRanges(pigeon_instance: CameraInfo): List<IntRange> {
        return pigeon_instance.supportedFrameRateRanges.map { IntRange(it) }
    }

    override fun isLogicalMultiCameraSupported(pigeon_instance: CameraInfo): Boolean {
        return pigeon_instance.isLogicalMultiCameraSupported
    }

    override fun isLowLightBoostSupported(pigeon_instance: CameraInfo): Boolean {
        return pigeon_instance.isLowLightBoostSupported
    }

    override fun isTorchStrengthSupported(pigeon_instance: CameraInfo): Boolean {
        return pigeon_instance.isTorchStrengthSupported
    }

    @OptIn(ExperimentalZeroShutterLag::class)
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