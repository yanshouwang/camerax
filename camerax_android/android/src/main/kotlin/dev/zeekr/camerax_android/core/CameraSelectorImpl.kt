package dev.zeekr.camerax_android.core

import androidx.annotation.OptIn
import androidx.camera.core.CameraInfo
import androidx.camera.core.CameraSelector
import androidx.camera.core.ExperimentalLensFacing
import dev.zeekr.camerax_android.CameraSelectorLensFacingApi
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiCameraSelectorProxyApi

class CameraSelectorImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiCameraSelectorProxyApi(registrar) {
    override fun build(lensFacing: CameraSelectorLensFacingApi?): CameraSelector {
        val builder = CameraSelector.Builder()
        if (lensFacing != null) {
            builder.requireLensFacing(lensFacing.impl)
        }
        return builder.build()
    }

    override fun back(): CameraSelector {
        return CameraSelector.DEFAULT_BACK_CAMERA
    }

    override fun front(): CameraSelector {
        return CameraSelector.DEFAULT_FRONT_CAMERA
    }

    override fun external(): CameraSelector {
        return CameraSelector.Builder().requireLensFacing(CameraSelector.LENS_FACING_EXTERNAL).build()
    }

    override fun filter(pigeon_instance: CameraSelector, cameraInfos: List<CameraInfo>): List<CameraInfo> {
        return pigeon_instance.filter(cameraInfos)
    }

    override fun getPhysicalCameraId(pigeon_instance: CameraSelector): String? {
        return pigeon_instance.physicalCameraId
    }
}

val CameraSelectorLensFacingApi.impl: Int
    @OptIn(ExperimentalLensFacing::class)
    get() = when (this) {
        CameraSelectorLensFacingApi.UNKNOWN -> CameraSelector.LENS_FACING_UNKNOWN
        CameraSelectorLensFacingApi.FRONT -> CameraSelector.LENS_FACING_FRONT
        CameraSelectorLensFacingApi.BACK -> CameraSelector.LENS_FACING_BACK
        CameraSelectorLensFacingApi.EXTERNAL -> CameraSelector.LENS_FACING_EXTERNAL
    }

val Int.cameraSelectorLensFacingApi: CameraSelectorLensFacingApi
    @OptIn(ExperimentalLensFacing::class)
    get() = when (this) {
        CameraSelector.LENS_FACING_UNKNOWN -> CameraSelectorLensFacingApi.UNKNOWN
        CameraSelector.LENS_FACING_FRONT -> CameraSelectorLensFacingApi.FRONT
        CameraSelector.LENS_FACING_BACK -> CameraSelectorLensFacingApi.BACK
        CameraSelector.LENS_FACING_EXTERNAL -> CameraSelectorLensFacingApi.EXTERNAL
        else -> throw NotImplementedError("Not implemented value: $this")
    }