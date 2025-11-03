package dev.zeekr.camerax_android.core.resolutionselector

import androidx.camera.core.resolutionselector.AspectRatioStrategy
import dev.zeekr.camerax_android.AspectRatioApi
import dev.zeekr.camerax_android.AspectRatioStrategyFallbackRuleApi
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiAspectRatioStrategyApi
import dev.zeekr.camerax_android.core.aspectRatioApi
import dev.zeekr.camerax_android.core.impl

class AspectRatioStrategyImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiAspectRatioStrategyApi(registrar) {
    override fun pigeon_defaultConstructor(
        preferredAspectRatio: AspectRatioApi, fallbackRule: AspectRatioStrategyFallbackRuleApi
    ): AspectRatioStrategy {
        return AspectRatioStrategy(preferredAspectRatio.impl, fallbackRule.impl)
    }

    override fun preferredAspectRatio(pigeon_instance: AspectRatioStrategy): AspectRatioApi {
        return pigeon_instance.preferredAspectRatio.aspectRatioApi
    }

    override fun fallbackRule(pigeon_instance: AspectRatioStrategy): AspectRatioStrategyFallbackRuleApi {
        return pigeon_instance.fallbackRule.aspectRatioStrategyFallbackRuleApi
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