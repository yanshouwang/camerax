package dev.hebei.camerax_android.core.resolutionselector

import android.util.Size

class ResolutionStrategy {
    companion object {
        val HIGHEST_AVAILABLE_STRATEGY get() = ResolutionStrategy(androidx.camera.core.resolutionselector.ResolutionStrategy.HIGHEST_AVAILABLE_STRATEGY)
    }

    internal constructor(obj: androidx.camera.core.resolutionselector.ResolutionStrategy) {
        this.obj = obj
    }

    constructor(boundSize: Size, fallbackRule: FallbackRule) {
        this.obj =
            androidx.camera.core.resolutionselector.ResolutionStrategy(boundSize, fallbackRule.obj)
    }

    internal val obj: androidx.camera.core.resolutionselector.ResolutionStrategy

    fun getBoundSize(): Size? {
        return obj.boundSize
    }

    fun getFallbackRule(): FallbackRule {
        return obj.fallbackRule.resolutionFallbackRuleArgs
    }

    enum class FallbackRule {
        NONE, CLOSEST_HIGHER_THEN_LOWER, CLOSET_HIGHER, CLOSEST_LOWER_THEN_HIGHER, CLOSET_LOWER,
    }
}

val ResolutionStrategy.FallbackRule.obj
    get() = when (this) {
        ResolutionStrategy.FallbackRule.NONE -> androidx.camera.core.resolutionselector.ResolutionStrategy.FALLBACK_RULE_NONE
        ResolutionStrategy.FallbackRule.CLOSEST_HIGHER_THEN_LOWER -> androidx.camera.core.resolutionselector.ResolutionStrategy.FALLBACK_RULE_CLOSEST_HIGHER_THEN_LOWER
        ResolutionStrategy.FallbackRule.CLOSET_HIGHER -> androidx.camera.core.resolutionselector.ResolutionStrategy.FALLBACK_RULE_CLOSEST_HIGHER
        ResolutionStrategy.FallbackRule.CLOSEST_LOWER_THEN_HIGHER -> androidx.camera.core.resolutionselector.ResolutionStrategy.FALLBACK_RULE_CLOSEST_LOWER_THEN_HIGHER
        ResolutionStrategy.FallbackRule.CLOSET_LOWER -> androidx.camera.core.resolutionselector.ResolutionStrategy.FALLBACK_RULE_CLOSEST_LOWER
    }

val Int.resolutionFallbackRuleArgs
    get() = when (this) {
        androidx.camera.core.resolutionselector.ResolutionStrategy.FALLBACK_RULE_NONE -> ResolutionStrategy.FallbackRule.NONE
        androidx.camera.core.resolutionselector.ResolutionStrategy.FALLBACK_RULE_CLOSEST_HIGHER_THEN_LOWER -> ResolutionStrategy.FallbackRule.CLOSEST_HIGHER_THEN_LOWER
        androidx.camera.core.resolutionselector.ResolutionStrategy.FALLBACK_RULE_CLOSEST_HIGHER -> ResolutionStrategy.FallbackRule.CLOSET_HIGHER
        androidx.camera.core.resolutionselector.ResolutionStrategy.FALLBACK_RULE_CLOSEST_LOWER_THEN_HIGHER -> ResolutionStrategy.FallbackRule.CLOSEST_LOWER_THEN_HIGHER
        androidx.camera.core.resolutionselector.ResolutionStrategy.FALLBACK_RULE_CLOSEST_LOWER -> ResolutionStrategy.FallbackRule.CLOSET_LOWER
        else -> throw IllegalArgumentException()
    }