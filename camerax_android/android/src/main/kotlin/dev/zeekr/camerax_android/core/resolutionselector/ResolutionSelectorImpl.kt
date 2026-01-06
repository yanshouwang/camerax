package dev.zeekr.camerax_android.core.resolutionselector

import androidx.camera.core.resolutionselector.AspectRatioStrategy
import androidx.camera.core.resolutionselector.ResolutionFilter
import androidx.camera.core.resolutionselector.ResolutionSelector
import androidx.camera.core.resolutionselector.ResolutionStrategy
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiResolutionSelectorBuilderProxyApi
import dev.zeekr.camerax_android.PigeonApiResolutionSelectorProxyApi
import dev.zeekr.camerax_android.ResolutionSelectorModeApi

class ResolutionSelectorImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiResolutionSelectorProxyApi(registrar) {
    class BuilderImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
        PigeonApiResolutionSelectorBuilderProxyApi(registrar) {
        override fun pigeon_defaultConstructor(): ResolutionSelector.Builder {
            return ResolutionSelector.Builder()
        }

        override fun setAllowedResolutionMode(
            pigeon_instance: ResolutionSelector.Builder, mode: ResolutionSelectorModeApi
        ): ResolutionSelector.Builder {
            return pigeon_instance.setAllowedResolutionMode(mode.impl)
        }

        override fun setAspectRatioStrategy(
            pigeon_instance: ResolutionSelector.Builder, aspectRatioStrategy: AspectRatioStrategy
        ): ResolutionSelector.Builder {
            return pigeon_instance.setAspectRatioStrategy(aspectRatioStrategy)
        }

        override fun setResolutionFilter(
            pigeon_instance: ResolutionSelector.Builder, resolutionFilter: ResolutionFilter
        ): ResolutionSelector.Builder {
            return pigeon_instance.setResolutionFilter(resolutionFilter)
        }

        override fun setResolutionStrategy(
            pigeon_instance: ResolutionSelector.Builder, resolutionStrategy: ResolutionStrategy
        ): ResolutionSelector.Builder {
            return pigeon_instance.setResolutionStrategy(resolutionStrategy)
        }

        override fun build(pigeon_instance: ResolutionSelector.Builder): ResolutionSelector {
            return pigeon_instance.build()
        }
    }

    override fun getAllowedResolutionMode(pigeon_instance: ResolutionSelector): ResolutionSelectorModeApi {
        return pigeon_instance.allowedResolutionMode.resolutionSelectorModeApi
    }

    override fun getAspectRatioStrategy(pigeon_instance: ResolutionSelector): AspectRatioStrategy {
        return pigeon_instance.aspectRatioStrategy
    }

    override fun getResolutionFilter(pigeon_instance: ResolutionSelector): ResolutionFilter? {
        return pigeon_instance.resolutionFilter
    }

    override fun getResolutionStrategy(pigeon_instance: ResolutionSelector): ResolutionStrategy? {
        return pigeon_instance.resolutionStrategy
    }
}

val Int.resolutionSelectorModeApi: ResolutionSelectorModeApi
    get() = when (this) {
        ResolutionSelector.PREFER_CAPTURE_RATE_OVER_HIGHER_RESOLUTION -> ResolutionSelectorModeApi.PREFER_CAPTURE_RATE_OVER_HIGHER_RESOLUTION
        ResolutionSelector.PREFER_HIGHER_RESOLUTION_OVER_CAPTURE_RATE -> ResolutionSelectorModeApi.PREFER_HIGHER_RESOLUTION_OVER_CAPTURE_RATE
        else -> throw NotImplementedError("Not implemented value: $this")
    }

val ResolutionSelectorModeApi.impl: Int
    get() = when (this) {
        ResolutionSelectorModeApi.PREFER_CAPTURE_RATE_OVER_HIGHER_RESOLUTION -> ResolutionSelector.PREFER_CAPTURE_RATE_OVER_HIGHER_RESOLUTION
        ResolutionSelectorModeApi.PREFER_HIGHER_RESOLUTION_OVER_CAPTURE_RATE -> ResolutionSelector.PREFER_HIGHER_RESOLUTION_OVER_CAPTURE_RATE
    }
