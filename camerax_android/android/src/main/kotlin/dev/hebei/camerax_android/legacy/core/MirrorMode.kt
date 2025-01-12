package dev.hebei.camerax_android.legacy.core

import dev.hebei.camerax_android.legacy.MirrorMode

val MirrorMode.obj
    get() = when (this) {
        MirrorMode.OFF -> androidx.camera.core.MirrorMode.MIRROR_MODE_OFF
        MirrorMode.ON -> androidx.camera.core.MirrorMode.MIRROR_MODE_ON
        MirrorMode.ON_FRONT_ONLY -> androidx.camera.core.MirrorMode.MIRROR_MODE_ON_FRONT_ONLY
    }

val Int.mirrorModeArgs
    get() = when (this) {
        androidx.camera.core.MirrorMode.MIRROR_MODE_OFF -> MirrorMode.OFF
        androidx.camera.core.MirrorMode.MIRROR_MODE_ON -> MirrorMode.ON
        androidx.camera.core.MirrorMode.MIRROR_MODE_ON_FRONT_ONLY -> MirrorMode.ON_FRONT_ONLY
        else -> throw IllegalArgumentException()
    }