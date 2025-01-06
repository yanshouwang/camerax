package dev.hebei.camerax_android.core

val Int.torchStateWrapper
    get() = when (this) {
        androidx.camera.core.TorchState.OFF -> false
        androidx.camera.core.TorchState.ON -> true
        else -> throw NotImplementedError()
    }