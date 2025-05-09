package dev.hebei.camerax_android.core.resolutionselector

import dev.hebei.camerax_android.CameraXRegistrar
import dev.hebei.camerax_android.PigeonApiResolutionFilterApi
import kotlinx.coroutines.runBlocking
import kotlin.coroutines.suspendCoroutine

class ResolutionFilterImpl(registrar: CameraXRegistrar) : PigeonApiResolutionFilterApi(registrar) {
    override fun pigeon_defaultConstructor(): androidx.camera.core.resolutionselector.ResolutionFilter {
        return Impl(this)
    }

    class Impl(private val api: PigeonApiResolutionFilterApi) :
        androidx.camera.core.resolutionselector.ResolutionFilter {
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