package dev.hebei.camerax_android.core

import androidx.camera.core.ExperimentalLensFacing

class CameraSelector internal constructor(internal val obj: androidx.camera.core.CameraSelector) {
    companion object {
        val FRONT = CameraSelector(androidx.camera.core.CameraSelector.DEFAULT_FRONT_CAMERA)
        val BACK = CameraSelector(androidx.camera.core.CameraSelector.DEFAULT_BACK_CAMERA)
        val EXTERNAL = Builder().requireLensFacing(LensFacing.EXTERNAL).build()
    }

    class Builder {
        private val builder = androidx.camera.core.CameraSelector.Builder()

        fun requireLensFacing(lensFacing: LensFacing): Builder {
            builder.requireLensFacing(lensFacing.obj)
            return this
        }

        fun build(): CameraSelector {
            val selector = builder.build()
            return CameraSelector(selector)
        }
    }

    enum class LensFacing {
        UNKNOWN, FRONT, BACK, EXTERNAL,
    }
}

val CameraSelector.LensFacing.obj
    @ExperimentalLensFacing get() = when (this) {
        CameraSelector.LensFacing.UNKNOWN -> androidx.camera.core.CameraSelector.LENS_FACING_UNKNOWN
        CameraSelector.LensFacing.FRONT -> androidx.camera.core.CameraSelector.LENS_FACING_FRONT
        CameraSelector.LensFacing.BACK -> androidx.camera.core.CameraSelector.LENS_FACING_BACK
        CameraSelector.LensFacing.EXTERNAL -> androidx.camera.core.CameraSelector.LENS_FACING_EXTERNAL
    }

val Int.lensFacingWrapper
    @ExperimentalLensFacing get() = when (this) {
        androidx.camera.core.CameraSelector.LENS_FACING_UNKNOWN -> CameraSelector.LensFacing.UNKNOWN
        androidx.camera.core.CameraSelector.LENS_FACING_FRONT -> CameraSelector.LensFacing.FRONT
        androidx.camera.core.CameraSelector.LENS_FACING_BACK -> CameraSelector.LensFacing.BACK
        androidx.camera.core.CameraSelector.LENS_FACING_EXTERNAL -> CameraSelector.LensFacing.EXTERNAL
        else -> throw NotImplementedError()
    }