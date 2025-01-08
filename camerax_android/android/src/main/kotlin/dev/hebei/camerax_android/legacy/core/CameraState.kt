package dev.hebei.camerax_android.legacy.core

import dev.hebei.camerax_android.legacy.CameraState

val dev.hebei.camerax_android.core.CameraState.args
    get() = when (this) {
        dev.hebei.camerax_android.core.CameraState.PENDING_OPEN -> CameraState.PENDING_OPEN
        dev.hebei.camerax_android.core.CameraState.OPENING -> CameraState.OPENING
        dev.hebei.camerax_android.core.CameraState.OPEN -> CameraState.OPEN
        dev.hebei.camerax_android.core.CameraState.CLOSING -> CameraState.CLOSING
        dev.hebei.camerax_android.core.CameraState.CLOSED -> CameraState.CLOSED
    }