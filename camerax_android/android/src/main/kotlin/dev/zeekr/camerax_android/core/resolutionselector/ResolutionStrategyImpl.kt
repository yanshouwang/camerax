package dev.zeekr.camerax_android.core.resolutionselector

import android.util.Size
import androidx.camera.core.resolutionselector.ResolutionStrategy
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiResolutionStrategyApi
import dev.zeekr.camerax_android.ResolutionStrategyFallbackRuleApi

class ResolutionStrategyImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiResolutionStrategyApi(registrar) {
    override fun pigeon_defaultConstructor(
        boundSize: Size?, fallbackRule: ResolutionStrategyFallbackRuleApi
    ): ResolutionStrategy {
        return if (boundSize == null) ResolutionStrategy.HIGHEST_AVAILABLE_STRATEGY
        else ResolutionStrategy(boundSize, fallbackRule.impl)
    }

    override fun boundSize(pigeon_instance: ResolutionStrategy): Size? {
        return pigeon_instance.boundSize
    }

    override fun fallbackRule(pigeon_instance: ResolutionStrategy): ResolutionStrategyFallbackRuleApi {
        return pigeon_instance.fallbackRule.resolutionStrategyFallbackRuleApi
    }
}

val ResolutionStrategyFallbackRuleApi.impl: Int
    get() = when (this) {
        ResolutionStrategyFallbackRuleApi.NONE -> ResolutionStrategy.FALLBACK_RULE_NONE
        ResolutionStrategyFallbackRuleApi.CLOSEST_HIGHER_THEN_LOWER -> ResolutionStrategy.FALLBACK_RULE_CLOSEST_HIGHER_THEN_LOWER
        ResolutionStrategyFallbackRuleApi.CLOSEST_HIGHER -> ResolutionStrategy.FALLBACK_RULE_CLOSEST_HIGHER
        ResolutionStrategyFallbackRuleApi.CLOSEST_LOWER_THEN_HIGHER -> ResolutionStrategy.FALLBACK_RULE_CLOSEST_LOWER_THEN_HIGHER
        ResolutionStrategyFallbackRuleApi.CLOSEST_LOWER -> ResolutionStrategy.FALLBACK_RULE_CLOSEST_LOWER
    }

val Int.resolutionStrategyFallbackRuleApi: ResolutionStrategyFallbackRuleApi
    get() = when (this) {
        ResolutionStrategy.FALLBACK_RULE_NONE -> ResolutionStrategyFallbackRuleApi.NONE
        ResolutionStrategy.FALLBACK_RULE_CLOSEST_HIGHER_THEN_LOWER -> ResolutionStrategyFallbackRuleApi.CLOSEST_HIGHER_THEN_LOWER
        ResolutionStrategy.FALLBACK_RULE_CLOSEST_HIGHER -> ResolutionStrategyFallbackRuleApi.CLOSEST_HIGHER
        ResolutionStrategy.FALLBACK_RULE_CLOSEST_LOWER_THEN_HIGHER -> ResolutionStrategyFallbackRuleApi.CLOSEST_LOWER_THEN_HIGHER
        ResolutionStrategy.FALLBACK_RULE_CLOSEST_LOWER -> ResolutionStrategyFallbackRuleApi.CLOSEST_LOWER
        else -> throw NotImplementedError("Not implemented value: $this")
    }