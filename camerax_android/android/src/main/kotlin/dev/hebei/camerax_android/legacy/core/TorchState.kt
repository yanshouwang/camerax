package dev.hebei.camerax_android.legacy.core

import dev.hebei.camerax_android.legacy.TorchState

val Int.torchStateArgs
    get() = when (this) {
        androidx.camera.core.TorchState.OFF -> TorchState.OFF
        androidx.camera.core.TorchState.ON -> TorchState.ON
        else -> throw IllegalArgumentException()
    }