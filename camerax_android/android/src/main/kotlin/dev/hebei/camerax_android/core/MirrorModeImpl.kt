package dev.hebei.camerax_android.core

import dev.hebei.camerax_android.MirrorModeApi

val MirrorModeApi.impl
    get() = when (this) {
        MirrorModeApi.OFF -> androidx.camera.core.MirrorMode.MIRROR_MODE_OFF
        MirrorModeApi.ON -> androidx.camera.core.MirrorMode.MIRROR_MODE_ON
        MirrorModeApi.ON_FRONT_ONLY -> androidx.camera.core.MirrorMode.MIRROR_MODE_ON_FRONT_ONLY
    }

val Int.mirrorModeApi
    get() = when (this) {
        androidx.camera.core.MirrorMode.MIRROR_MODE_OFF -> MirrorModeApi.OFF
        androidx.camera.core.MirrorMode.MIRROR_MODE_ON -> MirrorModeApi.ON
        androidx.camera.core.MirrorMode.MIRROR_MODE_ON_FRONT_ONLY -> MirrorModeApi.ON_FRONT_ONLY
        else -> throw IllegalArgumentException()
    }