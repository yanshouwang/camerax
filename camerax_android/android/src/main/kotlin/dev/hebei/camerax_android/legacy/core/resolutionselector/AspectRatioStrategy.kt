package dev.hebei.camerax_android.legacy.core.resolutionselector

import dev.hebei.camerax_android.legacy.AspectRatio
import dev.hebei.camerax_android.legacy.AspectRatioFallbackRule
import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiAspectRatioStrategy
import dev.hebei.camerax_android.legacy.core.args
import dev.hebei.camerax_android.legacy.core.obj

class AspectRatioStrategy(registrar: CameraXRegistrar) : PigeonApiAspectRatioStrategy(registrar) {
    override fun pigeon_defaultConstructor(
        preferredAspectRatio: AspectRatio, fallbackRule: AspectRatioFallbackRule
    ): dev.hebei.camerax_android.core.resolutionselector.AspectRatioStrategy {
        return dev.hebei.camerax_android.core.resolutionselector.AspectRatioStrategy(
            preferredAspectRatio.obj, fallbackRule.obj
        )
    }

    override fun ratio16_9FallbackAutoStrategy(): dev.hebei.camerax_android.core.resolutionselector.AspectRatioStrategy {
        return dev.hebei.camerax_android.core.resolutionselector.AspectRatioStrategy.RATIO_16_9_FALLBACK_AUTO_STRATEGY
    }

    override fun ratio4_3FallbackAutoStrategy(): dev.hebei.camerax_android.core.resolutionselector.AspectRatioStrategy {
        return dev.hebei.camerax_android.core.resolutionselector.AspectRatioStrategy.RATIO_4_3_FALLBACK_AUTO_STRATEGY
    }

    override fun getPreferredAspectRatio(pigeon_instance: dev.hebei.camerax_android.core.resolutionselector.AspectRatioStrategy): AspectRatio {
        return pigeon_instance.preferredAspectRatio.args
    }

    override fun getFallbackRule(pigeon_instance: dev.hebei.camerax_android.core.resolutionselector.AspectRatioStrategy): AspectRatioFallbackRule {
        return pigeon_instance.fallbackRule.args
    }

}

val AspectRatioFallbackRule.obj
    get() = when (this) {
        AspectRatioFallbackRule.NONE -> dev.hebei.camerax_android.core.resolutionselector.AspectRatioStrategy.FallbackRule.NONE
        AspectRatioFallbackRule.AUTO -> dev.hebei.camerax_android.core.resolutionselector.AspectRatioStrategy.FallbackRule.AUTO
    }

val dev.hebei.camerax_android.core.resolutionselector.AspectRatioStrategy.FallbackRule.args
    get() = when (this) {
        dev.hebei.camerax_android.core.resolutionselector.AspectRatioStrategy.FallbackRule.NONE -> AspectRatioFallbackRule.NONE
        dev.hebei.camerax_android.core.resolutionselector.AspectRatioStrategy.FallbackRule.AUTO -> AspectRatioFallbackRule.AUTO
    }