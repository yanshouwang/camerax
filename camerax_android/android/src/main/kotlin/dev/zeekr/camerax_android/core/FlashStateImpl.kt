package dev.zeekr.camerax_android.core

import androidx.camera.core.FlashState
import dev.zeekr.camerax_android.FlashStateApi

val Int.flashStateApi
    get() = when (this) {
        FlashState.UNKNOWN -> FlashStateApi.UNKNOWN
        FlashState.FIRED -> FlashStateApi.FIRED
        FlashState.UNAVAILABLE -> FlashStateApi.UNAVAILABLE
        FlashState.NOT_FIRED -> FlashStateApi.NOT_FIRED
        else -> throw NotImplementedError("Not implemented value: $this")
    }