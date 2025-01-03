package dev.hebei.camerax_android.legacy.core

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.LensFacing
import dev.hebei.camerax_android.legacy.PigeonApiCameraSelector

class CameraSelector(registrar: CameraXRegistrar) : PigeonApiCameraSelector(registrar) {
    override fun pigeon_defaultConstructor(lensFacing: LensFacing?): dev.hebei.camerax_android.core.CameraSelector {
        val builder = dev.hebei.camerax_android.core.CameraSelector.Builder()
        if (lensFacing != null) {
            builder.requireLensFacing(lensFacing.obj)
        }
        return builder.build()
    }

    override fun front(): dev.hebei.camerax_android.core.CameraSelector {
        return dev.hebei.camerax_android.core.CameraSelector.FRONT
    }

    override fun back(): dev.hebei.camerax_android.core.CameraSelector {
        return dev.hebei.camerax_android.core.CameraSelector.BACK
    }

    override fun external(): dev.hebei.camerax_android.core.CameraSelector {
        return dev.hebei.camerax_android.core.CameraSelector.EXTERNAL
    }
}

val LensFacing.obj
    get() = when (this) {
        LensFacing.UNKNOWN -> dev.hebei.camerax_android.core.CameraSelector.LensFacing.UNKNOWN
        LensFacing.FRONT -> dev.hebei.camerax_android.core.CameraSelector.LensFacing.FRONT
        LensFacing.BACK -> dev.hebei.camerax_android.core.CameraSelector.LensFacing.BACK
        LensFacing.EXTERNAL -> dev.hebei.camerax_android.core.CameraSelector.LensFacing.EXTERNAL
    }