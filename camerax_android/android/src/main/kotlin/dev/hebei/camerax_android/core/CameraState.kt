package dev.hebei.camerax_android.core

enum class CameraState {
    PENDING_OPEN, OPENING, OPEN, CLOSING, CLOSED,
}

val androidx.camera.core.CameraState.wrapper
    get() = when (type) {
        androidx.camera.core.CameraState.Type.PENDING_OPEN -> CameraState.PENDING_OPEN
        androidx.camera.core.CameraState.Type.OPENING -> CameraState.OPENING
        androidx.camera.core.CameraState.Type.OPEN -> CameraState.OPEN
        androidx.camera.core.CameraState.Type.CLOSING -> CameraState.CLOSING
        androidx.camera.core.CameraState.Type.CLOSED -> CameraState.CLOSED
    }