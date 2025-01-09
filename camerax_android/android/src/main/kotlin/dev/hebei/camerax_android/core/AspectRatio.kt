package dev.hebei.camerax_android.core

enum class AspectRatio {
    RATIO_DEFAULT, RATIO_4_3, RATIO_16_9,
}

val AspectRatio.obj
    get() = when (this) {
        AspectRatio.RATIO_DEFAULT -> androidx.camera.core.AspectRatio.RATIO_DEFAULT
        AspectRatio.RATIO_4_3 -> androidx.camera.core.AspectRatio.RATIO_4_3
        AspectRatio.RATIO_16_9 -> androidx.camera.core.AspectRatio.RATIO_16_9
    }

val Int.aspectRatioArgs
    get() = when (this) {
        androidx.camera.core.AspectRatio.RATIO_DEFAULT -> AspectRatio.RATIO_DEFAULT
        androidx.camera.core.AspectRatio.RATIO_4_3 -> AspectRatio.RATIO_4_3
        androidx.camera.core.AspectRatio.RATIO_16_9 -> AspectRatio.RATIO_16_9
        else -> throw IllegalArgumentException()
    }