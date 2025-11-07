package dev.zeekr.camerax_android.core

import androidx.camera.core.LowLightBoostState
import dev.zeekr.camerax_android.LowLightBoostStateApi

val Int.lowLightBoostStateApi: LowLightBoostStateApi
    get() = when (this) {
        LowLightBoostState.OFF -> LowLightBoostStateApi.OFF
        LowLightBoostState.INACTIVE -> LowLightBoostStateApi.INACTIVE
        LowLightBoostState.ACTIVE -> LowLightBoostStateApi.ACTIVE
        else -> throw NotImplementedError("Not implemented value: $this")
    }
