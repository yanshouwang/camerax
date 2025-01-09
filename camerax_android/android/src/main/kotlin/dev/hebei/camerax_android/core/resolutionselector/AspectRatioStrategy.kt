package dev.hebei.camerax_android.core.resolutionselector

import dev.hebei.camerax_android.core.AspectRatio
import dev.hebei.camerax_android.core.aspectRatioArgs
import dev.hebei.camerax_android.core.obj

class AspectRatioStrategy {
    companion object {
        val RATIO_16_9_FALLBACK_AUTO_STRATEGY get() = AspectRatioStrategy(androidx.camera.core.resolutionselector.AspectRatioStrategy.RATIO_16_9_FALLBACK_AUTO_STRATEGY)
        val RATIO_4_3_FALLBACK_AUTO_STRATEGY get() = AspectRatioStrategy(androidx.camera.core.resolutionselector.AspectRatioStrategy.RATIO_4_3_FALLBACK_AUTO_STRATEGY)
    }

    internal constructor(obj: androidx.camera.core.resolutionselector.AspectRatioStrategy) {
        this.obj = obj
    }

    constructor(preferredAspectRatio: AspectRatio, fallbackRule: FallbackRule) {
        this.obj = androidx.camera.core.resolutionselector.AspectRatioStrategy(
            preferredAspectRatio.obj, fallbackRule.obj
        )
    }

    internal val obj: androidx.camera.core.resolutionselector.AspectRatioStrategy

    fun getFallbackRule(): FallbackRule {
        return obj.fallbackRule.aspectRatioFallbackRuleArgs
    }

    fun getPreferredAspectRatio(): AspectRatio {
        return obj.preferredAspectRatio.aspectRatioArgs
    }

    enum class FallbackRule {
        NONE, AUTO,
    }
}

val AspectRatioStrategy.FallbackRule.obj
    get() = when (this) {
        AspectRatioStrategy.FallbackRule.NONE -> androidx.camera.core.resolutionselector.AspectRatioStrategy.FALLBACK_RULE_NONE
        AspectRatioStrategy.FallbackRule.AUTO -> androidx.camera.core.resolutionselector.AspectRatioStrategy.FALLBACK_RULE_AUTO
    }

val Int.aspectRatioFallbackRuleArgs
    get() = when (this) {
        androidx.camera.core.resolutionselector.AspectRatioStrategy.FALLBACK_RULE_NONE -> AspectRatioStrategy.FallbackRule.NONE
        androidx.camera.core.resolutionselector.AspectRatioStrategy.FALLBACK_RULE_AUTO -> AspectRatioStrategy.FallbackRule.AUTO
        else -> throw IllegalArgumentException()
    }