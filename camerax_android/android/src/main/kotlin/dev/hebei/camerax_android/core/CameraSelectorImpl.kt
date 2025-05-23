package dev.hebei.camerax_android.core

import androidx.camera.core.CameraSelector
import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.LensFacingApi
import dev.hebei.camerax_android.PigeonApiCameraSelectorApi

class CameraSelectorImpl(impl: CameraXImpl) : PigeonApiCameraSelectorApi(impl) {
    override fun pigeon_defaultConstructor(lensFacing: LensFacingApi?): CameraSelector {
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

    override fun external(): CameraSelector {
        return CameraSelector.Builder().requireLensFacing(CameraSelector.LENS_FACING_EXTERNAL).build()
    }
}

val LensFacingApi.impl
    get() = when (this) {
        LensFacingApi.UNKNOWN -> CameraSelector.LENS_FACING_UNKNOWN
        LensFacingApi.FRONT -> CameraSelector.LENS_FACING_FRONT
        LensFacingApi.BACK -> CameraSelector.LENS_FACING_BACK
        LensFacingApi.EXTERNAL -> CameraSelector.LENS_FACING_EXTERNAL
    }

val Int.lensFacingApi
    get() = when (this) {
        CameraSelector.LENS_FACING_UNKNOWN -> LensFacingApi.UNKNOWN
        CameraSelector.LENS_FACING_FRONT -> LensFacingApi.FRONT
        CameraSelector.LENS_FACING_BACK -> LensFacingApi.BACK
        CameraSelector.LENS_FACING_EXTERNAL -> LensFacingApi.EXTERNAL
        else -> throw IllegalArgumentException()
    }