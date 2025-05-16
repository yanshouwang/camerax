package dev.hebei.camerax_android.ml.barcode

import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.PigeonApiZoomCallbackApi
import dev.hebei.camerax_android.PigeonApiZoomSuggestionOptionsApi
import kotlinx.coroutines.runBlocking
import kotlin.coroutines.suspendCoroutine

class ZoomSuggestionOptionsImpl(impl: CameraXImpl) : PigeonApiZoomSuggestionOptionsApi(impl) {
    override fun build(
        zoomCallback: com.google.mlkit.vision.barcode.ZoomSuggestionOptions.ZoomCallback, maxSupportedZoomRatio: Double?
    ): com.google.mlkit.vision.barcode.ZoomSuggestionOptions {
        val builder = com.google.mlkit.vision.barcode.ZoomSuggestionOptions.Builder(zoomCallback)
        if (maxSupportedZoomRatio != null) {
            builder.setMaxSupportedZoomRatio(maxSupportedZoomRatio.toFloat())
        }
        return builder.build()
    }

    class ZoomCallbackImpl(impl: CameraXImpl) : PigeonApiZoomCallbackApi(impl) {
        override fun pigeon_defaultConstructor(): com.google.mlkit.vision.barcode.ZoomSuggestionOptions.ZoomCallback {
            return Impl(this)
        }

        class Impl(private val api: PigeonApiZoomCallbackApi) :
            com.google.mlkit.vision.barcode.ZoomSuggestionOptions.ZoomCallback {
            override fun setZoom(zoomRatio: Float): Boolean {
                return runBlocking { setZoomAsync(zoomRatio) }
            }

            private suspend fun setZoomAsync(zoomRatio: Float): Boolean {
                return suspendCoroutine { continuation ->
                    api.setZoom(this, zoomRatio.toDouble()) { result ->
                        continuation.resumeWith(result)
                    }
                }
            }
        }
    }
}