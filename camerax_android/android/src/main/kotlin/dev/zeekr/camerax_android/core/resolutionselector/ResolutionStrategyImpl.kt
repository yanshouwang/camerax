package dev.zeekr.camerax_android.core.resolutionselector

import android.util.Size
import androidx.camera.core.resolutionselector.ResolutionStrategy
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiResolutionStrategyProxyApi
import dev.zeekr.camerax_android.PigeonApiResolutionStrategyUtilProxyApi
import dev.zeekr.camerax_android.ResolutionStrategyFallbackRuleApi

class ResolutionStrategyImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiResolutionStrategyProxyApi(registrar) {
    class UtilImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiResolutionStrategyUtilProxyApi(registrar) {
        override fun fromFallbackRule(value: Long): ResolutionStrategyFallbackRuleApi {
            return Util.fromFallbackRule(value.toInt())
        }

        override fun toFallbackRule(api: ResolutionStrategyFallbackRuleApi): Long {
            return Util.toFallbackRule(api).toLong()
        }
    }

    object Util {
        fun fromFallbackRule(value: Int): ResolutionStrategyFallbackRuleApi {
            return when (value) {
                ResolutionStrategy.FALLBACK_RULE_NONE -> ResolutionStrategyFallbackRuleApi.NONE
                ResolutionStrategy.FALLBACK_RULE_CLOSEST_HIGHER_THEN_LOWER -> ResolutionStrategyFallbackRuleApi.CLOSEST_HIGHER_THEN_LOWER
                ResolutionStrategy.FALLBACK_RULE_CLOSEST_HIGHER -> ResolutionStrategyFallbackRuleApi.CLOSEST_HIGHER
                ResolutionStrategy.FALLBACK_RULE_CLOSEST_LOWER_THEN_HIGHER -> ResolutionStrategyFallbackRuleApi.CLOSEST_LOWER_THEN_HIGHER
                ResolutionStrategy.FALLBACK_RULE_CLOSEST_LOWER -> ResolutionStrategyFallbackRuleApi.CLOSEST_LOWER
                else -> throw NotImplementedError("Not implemented value: $this")
            }
        }

        fun toFallbackRule(api: ResolutionStrategyFallbackRuleApi): Int {
            return when (api) {
                ResolutionStrategyFallbackRuleApi.NONE -> ResolutionStrategy.FALLBACK_RULE_NONE
                ResolutionStrategyFallbackRuleApi.CLOSEST_HIGHER_THEN_LOWER -> ResolutionStrategy.FALLBACK_RULE_CLOSEST_HIGHER_THEN_LOWER
                ResolutionStrategyFallbackRuleApi.CLOSEST_HIGHER -> ResolutionStrategy.FALLBACK_RULE_CLOSEST_HIGHER
                ResolutionStrategyFallbackRuleApi.CLOSEST_LOWER_THEN_HIGHER -> ResolutionStrategy.FALLBACK_RULE_CLOSEST_LOWER_THEN_HIGHER
                ResolutionStrategyFallbackRuleApi.CLOSEST_LOWER -> ResolutionStrategy.FALLBACK_RULE_CLOSEST_LOWER
            }
        }
    }

    override fun pigeon_defaultConstructor(boundSize: Size, fallbackRule: Long): ResolutionStrategy {
        return ResolutionStrategy(boundSize, fallbackRule.toInt())
    }

    override fun highestAvailableStrategy(): ResolutionStrategy {
        return ResolutionStrategy.HIGHEST_AVAILABLE_STRATEGY
    }

    override fun getBoundSize(pigeon_instance: ResolutionStrategy): Size? {
        return pigeon_instance.boundSize
    }

    override fun getFallbackRule(pigeon_instance: ResolutionStrategy): Long {
        return pigeon_instance.fallbackRule.toLong()
    }
}
