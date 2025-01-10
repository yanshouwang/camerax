package dev.hebei.camerax_android.core.resolutionselector

import android.util.Size

class ResolutionFilter {
    internal constructor(obj: androidx.camera.core.resolutionselector.ResolutionFilter) {
        this.obj = obj
    }

    constructor(stub: Stub) {
        this.obj =
            androidx.camera.core.resolutionselector.ResolutionFilter { supportedSizes, rotationDegrees ->
                stub.filter(supportedSizes, rotationDegrees)
            }
    }

    internal val obj: androidx.camera.core.resolutionselector.ResolutionFilter

    fun filter(supportedSizes: MutableList<Size>, rotationDegrees: Int): MutableList<Size> {
        return obj.filter(supportedSizes, rotationDegrees)
    }

    interface Stub {
        fun filter(supportedSizes: MutableList<Size>, rotationDegrees: Int): MutableList<Size>
    }
}