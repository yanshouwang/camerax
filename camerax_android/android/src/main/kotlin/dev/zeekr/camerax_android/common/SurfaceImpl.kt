package dev.zeekr.camerax_android.common

import android.view.Surface
import dev.zeekr.camerax_android.SurfaceRotationApi

val SurfaceRotationApi.impl: Int
    get() = when (this) {
        SurfaceRotationApi.ROTATION0 -> Surface.ROTATION_0
        SurfaceRotationApi.ROTATION90 -> Surface.ROTATION_90
        SurfaceRotationApi.ROTATION180 -> Surface.ROTATION_180
        SurfaceRotationApi.ROTATION270 -> Surface.ROTATION_270
    }