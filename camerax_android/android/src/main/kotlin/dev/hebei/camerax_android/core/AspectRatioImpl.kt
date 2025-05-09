package dev.hebei.camerax_android.core

import dev.hebei.camerax_android.AspectRatioApi

val AspectRatioApi.impl
    get() = when (this) {
        AspectRatioApi.RATIO_DEFAULT -> androidx.camera.core.AspectRatio.RATIO_DEFAULT
        AspectRatioApi.RATIO4_3 -> androidx.camera.core.AspectRatio.RATIO_4_3
        AspectRatioApi.RATIO16_9 -> androidx.camera.core.AspectRatio.RATIO_16_9
    }

val Int.aspectRatioApi
    get() = when (this) {
        androidx.camera.core.AspectRatio.RATIO_DEFAULT -> AspectRatioApi.RATIO_DEFAULT
        androidx.camera.core.AspectRatio.RATIO_4_3 -> AspectRatioApi.RATIO4_3
        androidx.camera.core.AspectRatio.RATIO_16_9 -> AspectRatioApi.RATIO16_9
        else -> throw IllegalArgumentException()
    }