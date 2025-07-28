package dev.zeekr.camerax_android.core

import androidx.camera.core.MirrorMode
import dev.zeekr.camerax_android.MirrorModeApi

val MirrorModeApi.impl
    get() = when (this) {
        MirrorModeApi.OFF -> MirrorMode.MIRROR_MODE_OFF
        MirrorModeApi.ON -> MirrorMode.MIRROR_MODE_ON
        MirrorModeApi.ON_FRONT_ONLY -> MirrorMode.MIRROR_MODE_ON_FRONT_ONLY
    }

val Int.mirrorModeApi
    get() = when (this) {
        MirrorMode.MIRROR_MODE_OFF -> MirrorModeApi.OFF
        MirrorMode.MIRROR_MODE_ON -> MirrorModeApi.ON
        MirrorMode.MIRROR_MODE_ON_FRONT_ONLY -> MirrorModeApi.ON_FRONT_ONLY
        else -> throw IllegalArgumentException()
    }