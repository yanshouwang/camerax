package dev.hebei.camerax_android.legacy.core.resolutionselector

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiResolutionFilter
import kotlinx.coroutines.runBlocking
import kotlin.coroutines.suspendCoroutine

class ResolutionFilter(registrar: CameraXRegistrar) : PigeonApiResolutionFilter(registrar) {
    override fun pigeon_defaultConstructor(): androidx.camera.core.resolutionselector.ResolutionFilter {
        return Impl(this)
    }

    class Impl(private val api: ResolutionFilter) : androidx.camera.core.resolutionselector.ResolutionFilter {
        override fun filter(
            supportedSizes: MutableList<android.util.Size>, rotationDegrees: Int
        ): MutableList<android.util.Size> {
            return runBlocking { filterAsync(supportedSizes, rotationDegrees) }
        }

        private suspend fun filterAsync(
            supportedSizes: MutableList<android.util.Size>, rotationDegrees: Int
        ): MutableList<android.util.Size> {
            return suspendCoroutine { continuation ->
                api.filter(this, supportedSizes, rotationDegrees.toLong()) { result ->
                    continuation.resumeWith(result.map { sizes -> sizes.toMutableList() })
                }
            }
        }
    }
}