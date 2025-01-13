package dev.hebei.camerax_android.legacy.core.resolutionselector

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiResolutionSelector
import dev.hebei.camerax_android.legacy.ResolutionMode

class ResolutionSelector(registrar: CameraXRegistrar) : PigeonApiResolutionSelector(registrar) {
    override fun pigeon_defaultConstructor(
        allowedResolutionMode: ResolutionMode,
        aspectRatioStrategy: androidx.camera.core.resolutionselector.AspectRatioStrategy,
        resolutionFilter: androidx.camera.core.resolutionselector.ResolutionFilter?,
        resolutionStrategy: androidx.camera.core.resolutionselector.ResolutionStrategy?
    ): androidx.camera.core.resolutionselector.ResolutionSelector {
        val builder = androidx.camera.core.resolutionselector.ResolutionSelector.Builder()
            .setAllowedResolutionMode(allowedResolutionMode.obj).setAspectRatioStrategy(aspectRatioStrategy)
        if (resolutionFilter != null) {
            builder.setResolutionFilter(resolutionFilter)
        }
        if (resolutionStrategy != null) {
            builder.setResolutionStrategy(resolutionStrategy)
        }
        return builder.build()
    }

    override fun allowedResolutionMode(pigeon_instance: androidx.camera.core.resolutionselector.ResolutionSelector): ResolutionMode {
        return pigeon_instance.allowedResolutionMode.resolutionModeArgs
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

val ResolutionMode.obj
    get() = when (this) {
        ResolutionMode.PREFER_CAPTURE_RATE_OVER_HIGHER_RESOLUTION -> androidx.camera.core.resolutionselector.ResolutionSelector.PREFER_CAPTURE_RATE_OVER_HIGHER_RESOLUTION
        ResolutionMode.PREFER_HIGHER_RESOLUTION_OVER_CAPTURE_RATE -> androidx.camera.core.resolutionselector.ResolutionSelector.PREFER_HIGHER_RESOLUTION_OVER_CAPTURE_RATE
    }

val Int.resolutionModeArgs
    get() = when (this) {
        androidx.camera.core.resolutionselector.ResolutionSelector.PREFER_CAPTURE_RATE_OVER_HIGHER_RESOLUTION -> ResolutionMode.PREFER_CAPTURE_RATE_OVER_HIGHER_RESOLUTION
        androidx.camera.core.resolutionselector.ResolutionSelector.PREFER_HIGHER_RESOLUTION_OVER_CAPTURE_RATE -> ResolutionMode.PREFER_HIGHER_RESOLUTION_OVER_CAPTURE_RATE
        else -> throw IllegalArgumentException()
    }