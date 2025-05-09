package dev.hebei.camerax_android.core

import dev.hebei.camerax_android.CameraStateApi

val androidx.camera.core.CameraState.api
    get() = when (type) {
        androidx.camera.core.CameraState.Type.PENDING_OPEN -> CameraStateApi.PENDING_OPEN
        androidx.camera.core.CameraState.Type.OPENING -> CameraStateApi.OPENING
        androidx.camera.core.CameraState.Type.OPEN -> CameraStateApi.OPEN
        androidx.camera.core.CameraState.Type.CLOSING -> CameraStateApi.CLOSING
        androidx.camera.core.CameraState.Type.CLOSED -> CameraStateApi.CLOSED
    }