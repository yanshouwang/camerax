package dev.hebei.camerax_android.legacy.core

import dev.hebei.camerax_android.legacy.CameraState

val androidx.camera.core.CameraState.args
    get() = when (type) {
        androidx.camera.core.CameraState.Type.PENDING_OPEN -> CameraState.PENDING_OPEN
        androidx.camera.core.CameraState.Type.OPENING -> CameraState.OPENING
        androidx.camera.core.CameraState.Type.OPEN -> CameraState.OPEN
        androidx.camera.core.CameraState.Type.CLOSING -> CameraState.CLOSING
        androidx.camera.core.CameraState.Type.CLOSED -> CameraState.CLOSED
    }