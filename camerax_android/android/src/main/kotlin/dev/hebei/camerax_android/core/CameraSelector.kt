package dev.hebei.camerax_android.core

import androidx.camera.core.ExperimentalLensFacing

class CameraSelector internal constructor(internal val obj: androidx.camera.core.CameraSelector) {
    class Builder {
        private val builder = androidx.camera.core.CameraSelector.Builder()

        @ExperimentalLensFacing
        fun requireLensFacing(lensFacing: LensFacing): Builder {
            val obj = when (lensFacing) {
                LensFacing.UNKNOWN -> androidx.camera.core.CameraSelector.LENS_FACING_UNKNOWN
                LensFacing.FRONT -> androidx.camera.core.CameraSelector.LENS_FACING_FRONT
                LensFacing.BACK -> androidx.camera.core.CameraSelector.LENS_FACING_BACK
                LensFacing.EXTERNAL -> androidx.camera.core.CameraSelector.LENS_FACING_EXTERNAL
            }
            builder.requireLensFacing(obj)
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