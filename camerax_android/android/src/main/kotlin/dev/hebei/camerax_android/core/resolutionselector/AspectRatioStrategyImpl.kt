package dev.hebei.camerax_android.core.resolutionselector

import dev.hebei.camerax_android.AspectRatioApi
import dev.hebei.camerax_android.AspectRatioFallbackRuleApi
import dev.hebei.camerax_android.CameraXRegistrar
import dev.hebei.camerax_android.PigeonApiAspectRatioStrategyApi
import dev.hebei.camerax_android.core.aspectRatioApi
import dev.hebei.camerax_android.core.impl

class AspectRatioStrategyImpl(registrar: CameraXRegistrar) : PigeonApiAspectRatioStrategyApi(registrar) {
    override fun pigeon_defaultConstructor(
        preferredAspectRatio: AspectRatioApi, fallbackRule: AspectRatioFallbackRuleApi
    ): androidx.camera.core.resolutionselector.AspectRatioStrategy {
        return androidx.camera.core.resolutionselector.AspectRatioStrategy(preferredAspectRatio.impl, fallbackRule.impl)
    }

    override fun preferredAspectRatio(pigeon_instance: androidx.camera.core.resolutionselector.AspectRatioStrategy): AspectRatioApi {
        return pigeon_instance.preferredAspectRatio.aspectRatioApi
    }

    override fun fallbackRule(pigeon_instance: androidx.camera.core.resolutionselector.AspectRatioStrategy): AspectRatioFallbackRuleApi {
        return pigeon_instance.fallbackRule.aspectRatioFallbackRuleApi
    }

}

val AspectRatioFallbackRuleApi.impl
    get() = when (this) {
        AspectRatioFallbackRuleApi.NONE -> androidx.camera.core.resolutionselector.AspectRatioStrategy.FALLBACK_RULE_NONE
        AspectRatioFallbackRuleApi.AUTO -> androidx.camera.core.resolutionselector.AspectRatioStrategy.FALLBACK_RULE_AUTO
    }

val Int.aspectRatioFallbackRuleApi
    get() = when (this) {
        androidx.camera.core.resolutionselector.AspectRatioStrategy.FALLBACK_RULE_NONE -> AspectRatioFallbackRuleApi.NONE
        androidx.camera.core.resolutionselector.AspectRatioStrategy.FALLBACK_RULE_AUTO -> AspectRatioFallbackRuleApi.AUTO
        else -> throw IllegalArgumentException()
    }