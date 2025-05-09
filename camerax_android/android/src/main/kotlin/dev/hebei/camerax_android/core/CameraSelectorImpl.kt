package dev.hebei.camerax_android.core

import dev.hebei.camerax_android.CameraXRegistrar
import dev.hebei.camerax_android.LensFacingApi
import dev.hebei.camerax_android.PigeonApiCameraSelectorApi

class CameraSelectorImpl(registrar: CameraXRegistrar) : PigeonApiCameraSelectorApi(registrar) {
    override fun pigeon_defaultConstructor(lensFacing: LensFacingApi?): androidx.camera.core.CameraSelector {
        val builder = androidx.camera.core.CameraSelector.Builder()
        if (lensFacing != null) {
            builder.requireLensFacing(lensFacing.impl)
        }
        return builder.build()
    }

    override fun front(): androidx.camera.core.CameraSelector {
        return androidx.camera.core.CameraSelector.DEFAULT_FRONT_CAMERA
    }

    override fun back(): androidx.camera.core.CameraSelector {
        return androidx.camera.core.CameraSelector.DEFAULT_BACK_CAMERA
    }

    override fun external(): androidx.camera.core.CameraSelector {
        return androidx.camera.core.CameraSelector.Builder()
            .requireLensFacing(androidx.camera.core.CameraSelector.LENS_FACING_EXTERNAL).build()
    }
}

val LensFacingApi.impl
    get() = when (this) {
        LensFacingApi.UNKNOWN -> androidx.camera.core.CameraSelector.LENS_FACING_UNKNOWN
        LensFacingApi.FRONT -> androidx.camera.core.CameraSelector.LENS_FACING_FRONT
        LensFacingApi.BACK -> androidx.camera.core.CameraSelector.LENS_FACING_BACK
        LensFacingApi.EXTERNAL -> androidx.camera.core.CameraSelector.LENS_FACING_EXTERNAL
    }

val Int.lensFacingApi
    get() = when (this) {
        androidx.camera.core.CameraSelector.LENS_FACING_UNKNOWN -> LensFacingApi.UNKNOWN
        androidx.camera.core.CameraSelector.LENS_FACING_FRONT -> LensFacingApi.FRONT
        androidx.camera.core.CameraSelector.LENS_FACING_BACK -> LensFacingApi.BACK
        androidx.camera.core.CameraSelector.LENS_FACING_EXTERNAL -> LensFacingApi.EXTERNAL
        else -> throw IllegalArgumentException()
    }