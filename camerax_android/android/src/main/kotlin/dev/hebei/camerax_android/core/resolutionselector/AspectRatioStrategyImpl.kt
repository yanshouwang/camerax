package dev.hebei.camerax_android.core.resolutionselector

import androidx.camera.core.resolutionselector.AspectRatioStrategy
import dev.hebei.camerax_android.AspectRatioApi
import dev.hebei.camerax_android.AspectRatioFallbackRuleApi
import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.PigeonApiAspectRatioStrategyApi
import dev.hebei.camerax_android.core.aspectRatioApi
import dev.hebei.camerax_android.core.impl

class AspectRatioStrategyImpl(impl: CameraXImpl) : PigeonApiAspectRatioStrategyApi(impl) {
    override fun pigeon_defaultConstructor(
        preferredAspectRatio: AspectRatioApi, fallbackRule: AspectRatioFallbackRuleApi
    ): AspectRatioStrategy {
        return AspectRatioStrategy(preferredAspectRatio.impl, fallbackRule.impl)
    }

    override fun preferredAspectRatio(pigeon_instance: AspectRatioStrategy): AspectRatioApi {
        return pigeon_instance.preferredAspectRatio.aspectRatioApi
    }

    override fun fallbackRule(pigeon_instance: AspectRatioStrategy): AspectRatioFallbackRuleApi {
        return pigeon_instance.fallbackRule.aspectRatioFallbackRuleApi
    }

}

val AspectRatioFallbackRuleApi.impl
    get() = when (this) {
        AspectRatioFallbackRuleApi.NONE -> AspectRatioStrategy.FALLBACK_RULE_NONE
        AspectRatioFallbackRuleApi.AUTO -> AspectRatioStrategy.FALLBACK_RULE_AUTO
    }

val Int.aspectRatioFallbackRuleApi
    get() = when (this) {
        AspectRatioStrategy.FALLBACK_RULE_NONE -> AspectRatioFallbackRuleApi.NONE
        AspectRatioStrategy.FALLBACK_RULE_AUTO -> AspectRatioFallbackRuleApi.AUTO
        else -> throw IllegalArgumentException()
    }