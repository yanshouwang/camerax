package dev.hebei.camerax_android.core.resolutionselector

import android.util.Size
import androidx.camera.core.resolutionselector.ResolutionFilter
import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.PigeonApiResolutionFilterApi
import kotlinx.coroutines.runBlocking
import kotlin.coroutines.suspendCoroutine

class ResolutionFilterImpl(impl: CameraXImpl) : PigeonApiResolutionFilterApi(impl) {
    override fun pigeon_defaultConstructor(): ResolutionFilter {
        return object : ResolutionFilter {
            override fun filter(supportedSizes: MutableList<Size>, rotationDegrees: Int): MutableList<Size> {
                return runBlocking { filterAsync(supportedSizes, rotationDegrees) }
            }

            private suspend fun filterAsync(
                supportedSizes: MutableList<Size>, rotationDegrees: Int
            ): MutableList<Size> {
                return suspendCoroutine { continuation ->
                    filter(this, supportedSizes, rotationDegrees.toLong()) { result ->
                        continuation.resumeWith(result.map { sizes -> sizes.toMutableList() })
                    }
                }
            }
        }
    }
}