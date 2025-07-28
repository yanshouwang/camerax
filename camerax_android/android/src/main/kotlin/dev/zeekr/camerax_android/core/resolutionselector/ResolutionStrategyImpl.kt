package dev.zeekr.camerax_android.core.resolutionselector

import android.util.Size
import androidx.camera.core.resolutionselector.ResolutionStrategy
import dev.zeekr.camerax_android.CameraXImpl
import dev.zeekr.camerax_android.PigeonApiResolutionStrategyApi
import dev.zeekr.camerax_android.ResolutionFallbackRuleApi

class ResolutionStrategyImpl(impl: CameraXImpl) : PigeonApiResolutionStrategyApi(impl) {
    override fun pigeon_defaultConstructor(
        boundSize: Size?, fallbackRule: ResolutionFallbackRuleApi
    ): ResolutionStrategy {
        return if (boundSize == null) ResolutionStrategy.HIGHEST_AVAILABLE_STRATEGY
        else ResolutionStrategy(boundSize, fallbackRule.impl)
    }

    override fun boundSize(pigeon_instance: ResolutionStrategy): Size? {
        return pigeon_instance.boundSize
    }

    override fun fallbackRule(pigeon_instance: ResolutionStrategy): ResolutionFallbackRuleApi {
        return pigeon_instance.fallbackRule.resolutionFallbackRuleApi
    }
}

val ResolutionFallbackRuleApi.impl
    get() = when (this) {
        ResolutionFallbackRuleApi.NONE -> ResolutionStrategy.FALLBACK_RULE_NONE
        ResolutionFallbackRuleApi.CLOSEST_HIGHER_THEN_LOWER -> ResolutionStrategy.FALLBACK_RULE_CLOSEST_HIGHER_THEN_LOWER
        ResolutionFallbackRuleApi.CLOSEST_HIGHER -> ResolutionStrategy.FALLBACK_RULE_CLOSEST_HIGHER
        ResolutionFallbackRuleApi.CLOSEST_LOWER_THEN_HIGHER -> ResolutionStrategy.FALLBACK_RULE_CLOSEST_LOWER_THEN_HIGHER
        ResolutionFallbackRuleApi.CLOSEST_LOWER -> ResolutionStrategy.FALLBACK_RULE_CLOSEST_LOWER
    }

val Int.resolutionFallbackRuleApi
    get() = when (this) {
        ResolutionStrategy.FALLBACK_RULE_NONE -> ResolutionFallbackRuleApi.NONE
        ResolutionStrategy.FALLBACK_RULE_CLOSEST_HIGHER_THEN_LOWER -> ResolutionFallbackRuleApi.CLOSEST_HIGHER_THEN_LOWER
        ResolutionStrategy.FALLBACK_RULE_CLOSEST_HIGHER -> ResolutionFallbackRuleApi.CLOSEST_HIGHER
        ResolutionStrategy.FALLBACK_RULE_CLOSEST_LOWER_THEN_HIGHER -> ResolutionFallbackRuleApi.CLOSEST_LOWER_THEN_HIGHER
        ResolutionStrategy.FALLBACK_RULE_CLOSEST_LOWER -> ResolutionFallbackRuleApi.CLOSEST_LOWER
        else -> throw IllegalArgumentException()
    }