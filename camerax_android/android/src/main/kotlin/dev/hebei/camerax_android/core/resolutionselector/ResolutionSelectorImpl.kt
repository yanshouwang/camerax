package dev.hebei.camerax_android.core.resolutionselector

import dev.hebei.camerax_android.CameraXRegistrar
import dev.hebei.camerax_android.PigeonApiResolutionSelectorApi
import dev.hebei.camerax_android.ResolutionModeApi

class ResolutionSelectorImpl(registrar: CameraXRegistrar) : PigeonApiResolutionSelectorApi(registrar) {
    override fun pigeon_defaultConstructor(
        allowedResolutionMode: ResolutionModeApi,
        aspectRatioStrategy: androidx.camera.core.resolutionselector.AspectRatioStrategy,
        resolutionFilter: androidx.camera.core.resolutionselector.ResolutionFilter?,
        resolutionStrategy: androidx.camera.core.resolutionselector.ResolutionStrategy?
    ): androidx.camera.core.resolutionselector.ResolutionSelector {
        val builder = androidx.camera.core.resolutionselector.ResolutionSelector.Builder()
            .setAllowedResolutionMode(allowedResolutionMode.impl).setAspectRatioStrategy(aspectRatioStrategy)
        if (resolutionFilter != null) {
            builder.setResolutionFilter(resolutionFilter)
        }
        if (resolutionStrategy != null) {
            builder.setResolutionStrategy(resolutionStrategy)
        }
        return builder.build()
    }

    override fun allowedResolutionMode(pigeon_instance: androidx.camera.core.resolutionselector.ResolutionSelector): ResolutionModeApi {
        return pigeon_instance.allowedResolutionMode.resolutionModeApi
    }

    override fun aspectRatioStrategy(pigeon_instance: androidx.camera.core.resolutionselector.ResolutionSelector): androidx.camera.core.resolutionselector.AspectRatioStrategy {
        return pigeon_instance.aspectRatioStrategy
    }

    override fun resolutionFilter(pigeon_instance: androidx.camera.core.resolutionselector.ResolutionSelector): androidx.camera.core.resolutionselector.ResolutionFilter? {
        return pigeon_instance.resolutionFilter
    }

    override fun resolutionStrategy(pigeon_instance: androidx.camera.core.resolutionselector.ResolutionSelector): androidx.camera.core.resolutionselector.ResolutionStrategy? {
        return pigeon_instance.resolutionStrategy
    }
}

val ResolutionModeApi.impl
    get() = when (this) {
        ResolutionModeApi.PREFER_CAPTURE_RATE_OVER_HIGHER_RESOLUTION -> androidx.camera.core.resolutionselector.ResolutionSelector.PREFER_CAPTURE_RATE_OVER_HIGHER_RESOLUTION
        ResolutionModeApi.PREFER_HIGHER_RESOLUTION_OVER_CAPTURE_RATE -> androidx.camera.core.resolutionselector.ResolutionSelector.PREFER_HIGHER_RESOLUTION_OVER_CAPTURE_RATE
    }

val Int.resolutionModeApi
    get() = when (this) {
        androidx.camera.core.resolutionselector.ResolutionSelector.PREFER_CAPTURE_RATE_OVER_HIGHER_RESOLUTION -> ResolutionModeApi.PREFER_CAPTURE_RATE_OVER_HIGHER_RESOLUTION
        androidx.camera.core.resolutionselector.ResolutionSelector.PREFER_HIGHER_RESOLUTION_OVER_CAPTURE_RATE -> ResolutionModeApi.PREFER_HIGHER_RESOLUTION_OVER_CAPTURE_RATE
        else -> throw IllegalArgumentException()
    }