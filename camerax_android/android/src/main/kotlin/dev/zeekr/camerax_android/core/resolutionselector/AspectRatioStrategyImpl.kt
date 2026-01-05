package dev.zeekr.camerax_android.core.resolutionselector

import androidx.camera.core.resolutionselector.AspectRatioStrategy
import dev.zeekr.camerax_android.AspectRatioApi
import dev.zeekr.camerax_android.AspectRatioStrategyFallbackRuleApi
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiAspectRatioStrategyProxyApi
import dev.zeekr.camerax_android.PigeonApiAspectRatioStrategyUtilProxyApi
import dev.zeekr.camerax_android.core.aspectRatioApi
import dev.zeekr.camerax_android.core.impl

class AspectRatioStrategyImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiAspectRatioStrategyProxyApi(registrar) {
    class UtilImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiAspectRatioStrategyUtilProxyApi(registrar) {
        override fun fromFallbackRule(value: Long): AspectRatioStrategyFallbackRuleApi {
            return Util.fromFallbackRule(value.toInt())
        }

        override fun toFallbackRule(api: AspectRatioStrategyFallbackRuleApi): Long {
            return Util.toFallbackRule(api).toLong()
        }
    }

    object Util {
        fun fromFallbackRule(value: Int): AspectRatioStrategyFallbackRuleApi {
            return when (value) {
                AspectRatioStrategy.FALLBACK_RULE_NONE -> AspectRatioStrategyFallbackRuleApi.NONE
                AspectRatioStrategy.FALLBACK_RULE_AUTO -> AspectRatioStrategyFallbackRuleApi.AUTO
                else -> throw NotImplementedError("Not implemented value: $this")
            }
        }

        fun toFallbackRule(api: AspectRatioStrategyFallbackRuleApi): Int {
            return when (api) {
                AspectRatioStrategyFallbackRuleApi.NONE -> AspectRatioStrategy.FALLBACK_RULE_NONE
                AspectRatioStrategyFallbackRuleApi.AUTO -> AspectRatioStrategy.FALLBACK_RULE_AUTO
            }
        }
    }

    override fun pigeon_defaultConstructor(preferredAspectRatio: Long, fallbackRule: Long): AspectRatioStrategy {
        return AspectRatioStrategy(preferredAspectRatio.toInt(), fallbackRule.toInt())
    }

    override fun ratio4_3FallbackAutoStrategy(): AspectRatioStrategy {
        return AspectRatioStrategy.RATIO_4_3_FALLBACK_AUTO_STRATEGY
    }

    override fun ratio16_9FallbackAutoStrategy(): AspectRatioStrategy {
        return AspectRatioStrategy.RATIO_16_9_FALLBACK_AUTO_STRATEGY
    }

    override fun getFallbackRule(pigeon_instance: AspectRatioStrategy): Long {
        return pigeon_instance.fallbackRule.toLong()
    }

    override fun getPreferredAspectRatio(pigeon_instance: AspectRatioStrategy): Long {
        return pigeon_instance.preferredAspectRatio.toLong()
    }
}
