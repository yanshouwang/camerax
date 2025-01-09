package dev.hebei.camerax_android.core.resolutionselector

class ResolutionSelector internal constructor(internal val obj: androidx.camera.core.resolutionselector.ResolutionSelector) {
    val allowedResolutionMode get() = obj.allowedResolutionMode.resolutionModeArgs

    val aspectRatioStrategy: AspectRatioStrategy
        get() {
            val obj = this.obj.aspectRatioStrategy
            return AspectRatioStrategy(obj)
        }

    val resolutionFilter: ResolutionFilter?
        get() {
            val obj = this.obj.resolutionFilter
            return if (obj == null) null
            else ResolutionFilter(obj)
        }

    val resolutionStrategy: ResolutionStrategy?
        get() {
            val obj = this.obj.resolutionStrategy
            return if (obj == null) null
            else ResolutionStrategy(obj)
        }

    class Builder {
        internal constructor(obj: androidx.camera.core.resolutionselector.ResolutionSelector.Builder) {
            this.obj = obj
        }

        constructor() {
            this.obj = androidx.camera.core.resolutionselector.ResolutionSelector.Builder()
        }

        internal val obj: androidx.camera.core.resolutionselector.ResolutionSelector.Builder

        fun setAllowedResolutionMode(mode: ResolutionMode): Builder {
            val obj = this.obj.setAllowedResolutionMode(mode.obj)
            return Builder(obj)
        }

        fun setAspectRatioStrategy(aspectRatioStrategy: AspectRatioStrategy): Builder {
            val obj = this.obj.setAspectRatioStrategy(aspectRatioStrategy.obj)
            return Builder(obj)
        }

        fun setResolutionFilter(resolutionFilter: ResolutionFilter): Builder {
            val obj = this.obj.setResolutionFilter(resolutionFilter.obj)
            return Builder(obj)
        }

        fun setResolutionStrategy(resolutionStrategy: ResolutionStrategy): Builder {
            val obj = this.obj.setResolutionStrategy(resolutionStrategy.obj)
            return Builder(obj)
        }

        fun build(): ResolutionSelector {
            val obj = this.obj.build()
            return ResolutionSelector(obj)
        }
    }

    enum class ResolutionMode {
        PREFER_CAPTURE_RATE_OVER_HIGHER_RESOLUTION, PREFER_HIGHER_RESOLUTION_OVER_CAPTURE_RATE,
    }
}

val ResolutionSelector.ResolutionMode.obj
    get() = when (this) {
        ResolutionSelector.ResolutionMode.PREFER_CAPTURE_RATE_OVER_HIGHER_RESOLUTION -> androidx.camera.core.resolutionselector.ResolutionSelector.PREFER_CAPTURE_RATE_OVER_HIGHER_RESOLUTION
        ResolutionSelector.ResolutionMode.PREFER_HIGHER_RESOLUTION_OVER_CAPTURE_RATE -> androidx.camera.core.resolutionselector.ResolutionSelector.PREFER_HIGHER_RESOLUTION_OVER_CAPTURE_RATE
    }

val Int.resolutionModeArgs
    get() = when (this) {
        androidx.camera.core.resolutionselector.ResolutionSelector.PREFER_CAPTURE_RATE_OVER_HIGHER_RESOLUTION -> ResolutionSelector.ResolutionMode.PREFER_CAPTURE_RATE_OVER_HIGHER_RESOLUTION
        androidx.camera.core.resolutionselector.ResolutionSelector.PREFER_HIGHER_RESOLUTION_OVER_CAPTURE_RATE -> ResolutionSelector.ResolutionMode.PREFER_HIGHER_RESOLUTION_OVER_CAPTURE_RATE
        else -> throw IllegalArgumentException()
    }