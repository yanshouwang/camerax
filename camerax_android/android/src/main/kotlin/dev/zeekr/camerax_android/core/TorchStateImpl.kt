package dev.zeekr.camerax_android.core

import androidx.camera.core.TorchState
import dev.zeekr.camerax_android.TorchStateApi

val Int.torchStateApi
    get() = when (this) {
        TorchState.OFF -> TorchStateApi.OFF
        TorchState.ON -> TorchStateApi.ON
        else -> throw IllegalArgumentException()
    }