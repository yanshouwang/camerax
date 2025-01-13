package dev.hebei.camerax_android.legacy.core.resolutionselector

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiResolutionStrategy
import dev.hebei.camerax_android.legacy.ResolutionFallbackRule

class ResolutionStrategy(registrar: CameraXRegistrar) : PigeonApiResolutionStrategy(registrar) {
    override fun pigeon_defaultConstructor(
        boundSize: android.util.Size?, fallbackRule: ResolutionFallbackRule
    ): androidx.camera.core.resolutionselector.ResolutionStrategy {
        return if (boundSize == null) androidx.camera.core.resolutionselector.ResolutionStrategy.HIGHEST_AVAILABLE_STRATEGY
        else androidx.camera.core.resolutionselector.ResolutionStrategy(boundSize, fallbackRule.obj)
    }

    override fun boundSize(pigeon_instance: androidx.camera.core.resolutionselector.ResolutionStrategy): android.util.Size? {
        return pigeon_instance.boundSize
    }

    override fun fallbackRule(pigeon_instance: androidx.camera.core.resolutionselector.ResolutionStrategy): ResolutionFallbackRule {
        return pigeon_instance.fallbackRule.resolutionFallbackRuleArgs
    }
}

val ResolutionFallbackRule.obj
    get() = when (this) {
        ResolutionFallbackRule.NONE -> androidx.camera.core.resolutionselector.ResolutionStrategy.FALLBACK_RULE_NONE
        ResolutionFallbackRule.CLOSEST_HIGHER_THEN_LOWER -> androidx.camera.core.resolutionselector.ResolutionStrategy.FALLBACK_RULE_CLOSEST_HIGHER_THEN_LOWER
        ResolutionFallbackRule.CLOSEST_HIGHER -> androidx.camera.core.resolutionselector.ResolutionStrategy.FALLBACK_RULE_CLOSEST_HIGHER
        ResolutionFallbackRule.CLOSEST_LOWER_THEN_HIGHER -> androidx.camera.core.resolutionselector.ResolutionStrategy.FALLBACK_RULE_CLOSEST_LOWER_THEN_HIGHER
        ResolutionFallbackRule.CLOSEST_LOWER -> androidx.camera.core.resolutionselector.ResolutionStrategy.FALLBACK_RULE_CLOSEST_LOWER
    }

val Int.resolutionFallbackRuleArgs
    get() = when (this) {
        androidx.camera.core.resolutionselector.ResolutionStrategy.FALLBACK_RULE_NONE -> ResolutionFallbackRule.NONE
        androidx.camera.core.resolutionselector.ResolutionStrategy.FALLBACK_RULE_CLOSEST_HIGHER_THEN_LOWER -> ResolutionFallbackRule.CLOSEST_HIGHER_THEN_LOWER
        androidx.camera.core.resolutionselector.ResolutionStrategy.FALLBACK_RULE_CLOSEST_HIGHER -> ResolutionFallbackRule.CLOSEST_HIGHER
        androidx.camera.core.resolutionselector.ResolutionStrategy.FALLBACK_RULE_CLOSEST_LOWER_THEN_HIGHER -> ResolutionFallbackRule.CLOSEST_LOWER_THEN_HIGHER
        androidx.camera.core.resolutionselector.ResolutionStrategy.FALLBACK_RULE_CLOSEST_LOWER -> ResolutionFallbackRule.CLOSEST_LOWER
        else -> throw IllegalArgumentException()
    }