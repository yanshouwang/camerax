package dev.zeekr.camerax_android.core

import androidx.camera.core.TorchState
import dev.zeekr.camerax_android.TorchStateApi

val Int.torchStateApi: TorchStateApi
    get() = when (this) {
        TorchState.OFF -> TorchStateApi.OFF
        TorchState.ON -> TorchStateApi.ON
        else -> throw NotImplementedError("Not implemented value: $this")
    }