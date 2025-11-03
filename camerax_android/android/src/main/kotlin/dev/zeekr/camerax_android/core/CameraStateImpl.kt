package dev.zeekr.camerax_android.core

import androidx.camera.core.CameraState
import dev.zeekr.camerax_android.CameraStateApi

val CameraState.api: CameraStateApi
    get() = when (type) {
        CameraState.Type.PENDING_OPEN -> CameraStateApi.PENDING_OPEN
        CameraState.Type.OPENING -> CameraStateApi.OPENING
        CameraState.Type.OPEN -> CameraStateApi.OPEN
        CameraState.Type.CLOSING -> CameraStateApi.CLOSING
        CameraState.Type.CLOSED -> CameraStateApi.CLOSED
    }