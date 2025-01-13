package dev.hebei.camerax_android.legacy.core.resolutionselector

import dev.hebei.camerax_android.legacy.AspectRatio
import dev.hebei.camerax_android.legacy.AspectRatioFallbackRule
import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiAspectRatioStrategy
import dev.hebei.camerax_android.legacy.core.aspectRatioArgs
import dev.hebei.camerax_android.legacy.core.obj

class AspectRatioStrategy(registrar: CameraXRegistrar) : PigeonApiAspectRatioStrategy(registrar) {
    override fun pigeon_defaultConstructor(
        preferredAspectRatio: AspectRatio, fallbackRule: AspectRatioFallbackRule
    ): androidx.camera.core.resolutionselector.AspectRatioStrategy {
        return androidx.camera.core.resolutionselector.AspectRatioStrategy(
            preferredAspectRatio.obj, fallbackRule.obj
        )
    }

    override fun preferredAspectRatio(pigeon_instance: androidx.camera.core.resolutionselector.AspectRatioStrategy): AspectRatio {
        return pigeon_instance.preferredAspectRatio.aspectRatioArgs
    }

    override fun fallbackRule(pigeon_instance: androidx.camera.core.resolutionselector.AspectRatioStrategy): AspectRatioFallbackRule {
        return pigeon_instance.fallbackRule.aspectRatioFallbackRuleArgs
    }

}

val AspectRatioFallbackRule.obj
    get() = when (this) {
        AspectRatioFallbackRule.NONE -> androidx.camera.core.resolutionselector.AspectRatioStrategy.FALLBACK_RULE_NONE
        AspectRatioFallbackRule.AUTO -> androidx.camera.core.resolutionselector.AspectRatioStrategy.FALLBACK_RULE_AUTO
    }

val Int.aspectRatioFallbackRuleArgs
    get() = when (this) {
        androidx.camera.core.resolutionselector.AspectRatioStrategy.FALLBACK_RULE_NONE -> AspectRatioFallbackRule.NONE
        androidx.camera.core.resolutionselector.AspectRatioStrategy.FALLBACK_RULE_AUTO -> AspectRatioFallbackRule.AUTO
        else -> throw IllegalArgumentException()
    }