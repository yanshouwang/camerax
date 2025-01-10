package dev.hebei.camerax_android.legacy.core

import dev.hebei.camerax_android.legacy.AspectRatio

val AspectRatio.obj
    get() = when (this) {
        AspectRatio.RATIO_DEFAULT -> dev.hebei.camerax_android.core.AspectRatio.RATIO_DEFAULT
        AspectRatio.RATIO4_3 -> dev.hebei.camerax_android.core.AspectRatio.RATIO_4_3
        AspectRatio.RATIO16_9 -> dev.hebei.camerax_android.core.AspectRatio.RATIO_16_9
    }

val dev.hebei.camerax_android.core.AspectRatio.args
    get() = when (this) {
        dev.hebei.camerax_android.core.AspectRatio.RATIO_DEFAULT -> AspectRatio.RATIO_DEFAULT
        dev.hebei.camerax_android.core.AspectRatio.RATIO_4_3 -> AspectRatio.RATIO4_3
        dev.hebei.camerax_android.core.AspectRatio.RATIO_16_9 -> AspectRatio.RATIO16_9
    }