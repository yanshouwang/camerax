package dev.hebei.camerax_android.core

import dev.hebei.camerax_android.TorchStateApi

val Int.torchStateApi
    get() = when (this) {
        androidx.camera.core.TorchState.OFF -> TorchStateApi.OFF
        androidx.camera.core.TorchState.ON -> TorchStateApi.ON
        else -> throw IllegalArgumentException()
    }