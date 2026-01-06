package dev.zeekr.camerax_android.core

import androidx.camera.core.AspectRatio
import dev.zeekr.camerax_android.AspectRatioApi

val Int.aspectRatioApi: AspectRatioApi
    get() = when (this) {
        AspectRatio.RATIO_DEFAULT -> AspectRatioApi.RATIO_DEFAULT
        AspectRatio.RATIO_4_3 -> AspectRatioApi.RATIO4_3
        AspectRatio.RATIO_16_9 -> AspectRatioApi.RATIO16_9
        else -> throw IllegalArgumentException()
    }

val AspectRatioApi.impl: Int
    get() = when (this) {
        AspectRatioApi.RATIO_DEFAULT -> AspectRatio.RATIO_DEFAULT
        AspectRatioApi.RATIO4_3 -> AspectRatio.RATIO_4_3
        AspectRatioApi.RATIO16_9 -> AspectRatio.RATIO_16_9
    }