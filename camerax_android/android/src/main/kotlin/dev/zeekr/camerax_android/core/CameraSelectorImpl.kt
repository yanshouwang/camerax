package dev.zeekr.camerax_android.core

import androidx.camera.core.CameraSelector
import androidx.camera.core.ExperimentalLensFacing
import dev.zeekr.camerax_android.CameraSelectorLensFacingApi
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiCameraSelectorApi

class CameraSelectorImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiCameraSelectorApi(registrar) {
    override fun build(lensFacing: CameraSelectorLensFacingApi?): CameraSelector {
        val builder = CameraSelector.Builder()
        if (lensFacing != null) {
            builder.requireLensFacing(lensFacing.impl)
        }
        return builder.build()
    }

    override fun front(): CameraSelector {
        return CameraSelector.DEFAULT_FRONT_CAMERA
    }

    override fun back(): CameraSelector {
        return CameraSelector.DEFAULT_BACK_CAMERA
    }

    @ExperimentalLensFacing
    override fun external(): CameraSelector {
        return CameraSelector.Builder().requireLensFacing(CameraSelector.LENS_FACING_EXTERNAL).build()
    }
}

val CameraSelectorLensFacingApi.impl: Int
    @ExperimentalLensFacing get() = when (this) {
        CameraSelectorLensFacingApi.UNKNOWN -> CameraSelector.LENS_FACING_UNKNOWN
        CameraSelectorLensFacingApi.FRONT -> CameraSelector.LENS_FACING_FRONT
        CameraSelectorLensFacingApi.BACK -> CameraSelector.LENS_FACING_BACK
        CameraSelectorLensFacingApi.EXTERNAL -> CameraSelector.LENS_FACING_EXTERNAL
    }

val Int.cameraSelectorLensFacingApi: CameraSelectorLensFacingApi
    @ExperimentalLensFacing get() = when (this) {
        CameraSelector.LENS_FACING_UNKNOWN -> CameraSelectorLensFacingApi.UNKNOWN
        CameraSelector.LENS_FACING_FRONT -> CameraSelectorLensFacingApi.FRONT
        CameraSelector.LENS_FACING_BACK -> CameraSelectorLensFacingApi.BACK
        CameraSelector.LENS_FACING_EXTERNAL -> CameraSelectorLensFacingApi.EXTERNAL
        else -> throw NotImplementedError("Not implemented value: $this")
    }