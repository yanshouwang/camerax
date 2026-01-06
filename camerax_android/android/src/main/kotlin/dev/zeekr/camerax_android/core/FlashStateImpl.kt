package dev.zeekr.camerax_android.core

import androidx.camera.core.FlashState
import dev.zeekr.camerax_android.FlashStateApi

val Int.flashStateApi: FlashStateApi
    get() = when (this) {
        FlashState.UNKNOWN -> FlashStateApi.UNKNOWN
        FlashState.FIRED -> FlashStateApi.FIRED
        FlashState.UNAVAILABLE -> FlashStateApi.UNAVAILABLE
        FlashState.NOT_FIRED -> FlashStateApi.NOT_FIRED
        else -> throw NotImplementedError("Not implemented value: $this")
    }

val FlashStateApi.impl: Int
    get() = when (this) {
        FlashStateApi.UNKNOWN -> FlashState.UNKNOWN
        FlashStateApi.FIRED -> FlashState.FIRED
        FlashStateApi.UNAVAILABLE -> FlashState.UNAVAILABLE
        FlashStateApi.NOT_FIRED -> FlashState.NOT_FIRED
    }