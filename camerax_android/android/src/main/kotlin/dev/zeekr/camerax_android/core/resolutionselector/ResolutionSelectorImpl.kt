package dev.zeekr.camerax_android.core.resolutionselector

import androidx.camera.core.resolutionselector.AspectRatioStrategy
import androidx.camera.core.resolutionselector.ResolutionFilter
import androidx.camera.core.resolutionselector.ResolutionSelector
import androidx.camera.core.resolutionselector.ResolutionStrategy
import dev.zeekr.camerax_android.CameraXRegistrarImpl
import dev.zeekr.camerax_android.PigeonApiResolutionSelectorApi
import dev.zeekr.camerax_android.ResolutionModeApi

class ResolutionSelectorImpl(impl: CameraXRegistrarImpl) : PigeonApiResolutionSelectorApi(impl) {
    override fun pigeon_defaultConstructor(
        allowedResolutionMode: ResolutionModeApi,
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

    override fun allowedResolutionMode(pigeon_instance: ResolutionSelector): ResolutionModeApi {
        return pigeon_instance.allowedResolutionMode.resolutionModeApi
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

val ResolutionModeApi.impl
    get() = when (this) {
        ResolutionModeApi.PREFER_CAPTURE_RATE_OVER_HIGHER_RESOLUTION -> ResolutionSelector.PREFER_CAPTURE_RATE_OVER_HIGHER_RESOLUTION
        ResolutionModeApi.PREFER_HIGHER_RESOLUTION_OVER_CAPTURE_RATE -> ResolutionSelector.PREFER_HIGHER_RESOLUTION_OVER_CAPTURE_RATE
    }

val Int.resolutionModeApi
    get() = when (this) {
        ResolutionSelector.PREFER_CAPTURE_RATE_OVER_HIGHER_RESOLUTION -> ResolutionModeApi.PREFER_CAPTURE_RATE_OVER_HIGHER_RESOLUTION
        ResolutionSelector.PREFER_HIGHER_RESOLUTION_OVER_CAPTURE_RATE -> ResolutionModeApi.PREFER_HIGHER_RESOLUTION_OVER_CAPTURE_RATE
        else -> throw IllegalArgumentException()
    }