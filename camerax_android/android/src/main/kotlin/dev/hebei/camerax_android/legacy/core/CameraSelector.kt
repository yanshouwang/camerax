package dev.hebei.camerax_android.legacy.core

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.LensFacing
import dev.hebei.camerax_android.legacy.PigeonApiCameraSelector

class CameraSelector(registrar: CameraXRegistrar) : PigeonApiCameraSelector(registrar) {
    override fun pigeon_defaultConstructor(lensFacing: LensFacing?): androidx.camera.core.CameraSelector {
        val builder = androidx.camera.core.CameraSelector.Builder()
        if (lensFacing != null) {
            builder.requireLensFacing(lensFacing.obj)
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

val LensFacing.obj
    get() = when (this) {
        LensFacing.UNKNOWN -> androidx.camera.core.CameraSelector.LENS_FACING_UNKNOWN
        LensFacing.FRONT -> androidx.camera.core.CameraSelector.LENS_FACING_FRONT
        LensFacing.BACK -> androidx.camera.core.CameraSelector.LENS_FACING_BACK
        LensFacing.EXTERNAL -> androidx.camera.core.CameraSelector.LENS_FACING_EXTERNAL
    }

val Int.lensFacingArgs
    get() = when (this) {
        androidx.camera.core.CameraSelector.LENS_FACING_UNKNOWN -> LensFacing.UNKNOWN
        androidx.camera.core.CameraSelector.LENS_FACING_FRONT -> LensFacing.FRONT
        androidx.camera.core.CameraSelector.LENS_FACING_BACK -> LensFacing.BACK
        androidx.camera.core.CameraSelector.LENS_FACING_EXTERNAL -> LensFacing.EXTERNAL
        else -> throw IllegalArgumentException()
    }