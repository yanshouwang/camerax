package dev.hebei.camerax_android.core.resolutionselector

import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.PigeonApiResolutionStrategyApi
import dev.hebei.camerax_android.ResolutionFallbackRuleApi

class ResolutionStrategyImpl(impl: CameraXImpl) : PigeonApiResolutionStrategyApi(impl) {
    override fun pigeon_defaultConstructor(
        boundSize: android.util.Size?, fallbackRule: ResolutionFallbackRuleApi
    ): androidx.camera.core.resolutionselector.ResolutionStrategy {
        return if (boundSize == null) androidx.camera.core.resolutionselector.ResolutionStrategy.HIGHEST_AVAILABLE_STRATEGY
        else androidx.camera.core.resolutionselector.ResolutionStrategy(boundSize, fallbackRule.impl)
    }

    override fun boundSize(pigeon_instance: androidx.camera.core.resolutionselector.ResolutionStrategy): android.util.Size? {
        return pigeon_instance.boundSize
    }

    override fun fallbackRule(pigeon_instance: androidx.camera.core.resolutionselector.ResolutionStrategy): ResolutionFallbackRuleApi {
        return pigeon_instance.fallbackRule.resolutionFallbackRuleApi
    }
}

val ResolutionFallbackRuleApi.impl
    get() = when (this) {
        ResolutionFallbackRuleApi.NONE -> androidx.camera.core.resolutionselector.ResolutionStrategy.FALLBACK_RULE_NONE
        ResolutionFallbackRuleApi.CLOSEST_HIGHER_THEN_LOWER -> androidx.camera.core.resolutionselector.ResolutionStrategy.FALLBACK_RULE_CLOSEST_HIGHER_THEN_LOWER
        ResolutionFallbackRuleApi.CLOSEST_HIGHER -> androidx.camera.core.resolutionselector.ResolutionStrategy.FALLBACK_RULE_CLOSEST_HIGHER
        ResolutionFallbackRuleApi.CLOSEST_LOWER_THEN_HIGHER -> androidx.camera.core.resolutionselector.ResolutionStrategy.FALLBACK_RULE_CLOSEST_LOWER_THEN_HIGHER
        ResolutionFallbackRuleApi.CLOSEST_LOWER -> androidx.camera.core.resolutionselector.ResolutionStrategy.FALLBACK_RULE_CLOSEST_LOWER
    }

val Int.resolutionFallbackRuleApi
    get() = when (this) {
        androidx.camera.core.resolutionselector.ResolutionStrategy.FALLBACK_RULE_NONE -> ResolutionFallbackRuleApi.NONE
        androidx.camera.core.resolutionselector.ResolutionStrategy.FALLBACK_RULE_CLOSEST_HIGHER_THEN_LOWER -> ResolutionFallbackRuleApi.CLOSEST_HIGHER_THEN_LOWER
        androidx.camera.core.resolutionselector.ResolutionStrategy.FALLBACK_RULE_CLOSEST_HIGHER -> ResolutionFallbackRuleApi.CLOSEST_HIGHER
        androidx.camera.core.resolutionselector.ResolutionStrategy.FALLBACK_RULE_CLOSEST_LOWER_THEN_HIGHER -> ResolutionFallbackRuleApi.CLOSEST_LOWER_THEN_HIGHER
        androidx.camera.core.resolutionselector.ResolutionStrategy.FALLBACK_RULE_CLOSEST_LOWER -> ResolutionFallbackRuleApi.CLOSEST_LOWER
        else -> throw IllegalArgumentException()
    }