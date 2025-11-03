package dev.zeekr.camerax_android.core.resolutionselector

import androidx.camera.core.resolutionselector.AspectRatioStrategy
import androidx.camera.core.resolutionselector.ResolutionFilter
import androidx.camera.core.resolutionselector.ResolutionSelector
import androidx.camera.core.resolutionselector.ResolutionStrategy
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiResolutionSelectorApi
import dev.zeekr.camerax_android.ResolutionSelectorModeApi

class ResolutionSelectorImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiResolutionSelectorApi(registrar) {
    override fun build(
        allowedResolutionMode: ResolutionSelectorModeApi,
        aspectRatioStrategy: AspectRatioStrategy,
        resolutionFilter: ResolutionFilter?,
        resolutionStrategy: ResolutionStrategy?
    ): ResolutionSelector {
        val builder = ResolutionSelector.Builder().setAllowedResolutionMode(allowedResolutionMode.impl)
            .setAspectRatioStrategy(aspectRatioStrategy)
        if (resolutionFilter != null) {
            builder.setResolutionFilter(resolutionFilter)
        }
        if (resolutionStrategy != null) {
            builder.setResolutionStrategy(resolutionStrategy)
        }
        return builder.build()
    }

    override fun allowedResolutionMode(pigeon_instance: ResolutionSelector): ResolutionSelectorModeApi {
        return pigeon_instance.allowedResolutionMode.resolutionSelectorModeApi
    }

    override fun aspectRatioStrategy(pigeon_instance: ResolutionSelector): AspectRatioStrategy {
        return pigeon_instance.aspectRatioStrategy
    }

    override fun resolutionFilter(pigeon_instance: ResolutionSelector): ResolutionFilter? {
        return pigeon_instance.resolutionFilter
    }

    override fun resolutionStrategy(pigeon_instance: ResolutionSelector): ResolutionStrategy? {
        return pigeon_instance.resolutionStrategy
    }
}

val ResolutionSelectorModeApi.impl: Int
    get() = when (this) {
        ResolutionSelectorModeApi.PREFER_CAPTURE_RATE_OVER_HIGHER_RESOLUTION -> ResolutionSelector.PREFER_CAPTURE_RATE_OVER_HIGHER_RESOLUTION
        ResolutionSelectorModeApi.PREFER_HIGHER_RESOLUTION_OVER_CAPTURE_RATE -> ResolutionSelector.PREFER_HIGHER_RESOLUTION_OVER_CAPTURE_RATE
    }

val Int.resolutionSelectorModeApi: ResolutionSelectorModeApi
    get() = when (this) {
        ResolutionSelector.PREFER_CAPTURE_RATE_OVER_HIGHER_RESOLUTION -> ResolutionSelectorModeApi.PREFER_CAPTURE_RATE_OVER_HIGHER_RESOLUTION
        ResolutionSelector.PREFER_HIGHER_RESOLUTION_OVER_CAPTURE_RATE -> ResolutionSelectorModeApi.PREFER_HIGHER_RESOLUTION_OVER_CAPTURE_RATE
        else -> throw NotImplementedError("Not implemented value: $this")
    }