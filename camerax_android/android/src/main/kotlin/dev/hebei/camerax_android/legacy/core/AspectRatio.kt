package dev.hebei.camerax_android.legacy.core

import dev.hebei.camerax_android.legacy.AspectRatio

val AspectRatio.obj
    get() = when (this) {
        AspectRatio.RATIO_DEFAULT -> androidx.camera.core.AspectRatio.RATIO_DEFAULT
        AspectRatio.RATIO4_3 -> androidx.camera.core.AspectRatio.RATIO_4_3
        AspectRatio.RATIO16_9 -> androidx.camera.core.AspectRatio.RATIO_16_9
    }

val Int.aspectRatioArgs
    get() = when (this) {
        androidx.camera.core.AspectRatio.RATIO_DEFAULT -> AspectRatio.RATIO_DEFAULT
        androidx.camera.core.AspectRatio.RATIO_4_3 -> AspectRatio.RATIO4_3
        androidx.camera.core.AspectRatio.RATIO_16_9 -> AspectRatio.RATIO16_9
        else -> throw IllegalArgumentException()
    }