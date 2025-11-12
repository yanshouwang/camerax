package dev.zeekr.camerax_android.core.resolutionselector

import androidx.camera.core.resolutionselector.AspectRatioStrategy
import dev.zeekr.camerax_android.AspectRatioApi
import dev.zeekr.camerax_android.AspectRatioStrategyFallbackRuleApi
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiAspectRatioStrategyProxyApi
import dev.zeekr.camerax_android.core.aspectRatioApi
import dev.zeekr.camerax_android.core.impl

class AspectRatioStrategyImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiAspectRatioStrategyProxyApi(registrar) {
    override fun pigeon_defaultConstructor(
        preferredAspectRatio: AspectRatioApi, fallbackRule: AspectRatioStrategyFallbackRuleApi
    ): AspectRatioStrategy {
        return AspectRatioStrategy(preferredAspectRatio.impl, fallbackRule.impl)
    }

    override fun ratio4_3FallbackAutoStrategy(): AspectRatioStrategy {
        return AspectRatioStrategy.RATIO_4_3_FALLBACK_AUTO_STRATEGY
    }

    override fun ratio16_9FallbackAutoStrategy(): AspectRatioStrategy {
        return AspectRatioStrategy.RATIO_16_9_FALLBACK_AUTO_STRATEGY
    }

    override fun getFallbackRule(pigeon_instance: AspectRatioStrategy): AspectRatioStrategyFallbackRuleApi {
        return pigeon_instance.fallbackRule.aspectRatioStrategyFallbackRuleApi
    }

    override fun getPreferredAspectRatio(pigeon_instance: AspectRatioStrategy): AspectRatioApi {
        return pigeon_instance.preferredAspectRatio.aspectRatioApi
    }
}

val AspectRatioStrategyFallbackRuleApi.impl: Int
    get() = when (this) {
        AspectRatioStrategyFallbackRuleApi.NONE -> AspectRatioStrategy.FALLBACK_RULE_NONE
        AspectRatioStrategyFallbackRuleApi.AUTO -> AspectRatioStrategy.FALLBACK_RULE_AUTO
    }

val Int.aspectRatioStrategyFallbackRuleApi: AspectRatioStrategyFallbackRuleApi
    get() = when (this) {
        AspectRatioStrategy.FALLBACK_RULE_NONE -> AspectRatioStrategyFallbackRuleApi.NONE
        AspectRatioStrategy.FALLBACK_RULE_AUTO -> AspectRatioStrategyFallbackRuleApi.AUTO
        else -> throw NotImplementedError("Not implemented value: $this")
    }