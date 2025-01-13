package dev.hebei.camerax_android.legacy.ml.barcode

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiZoomCallback
import dev.hebei.camerax_android.legacy.PigeonApiZoomSuggestionOptions
import kotlinx.coroutines.runBlocking
import kotlin.coroutines.suspendCoroutine

class ZoomSuggestionOptions(registrar: CameraXRegistrar) : PigeonApiZoomSuggestionOptions(registrar) {
    override fun build(
        zoomCallback: com.google.mlkit.vision.barcode.ZoomSuggestionOptions.ZoomCallback, maxSupportedZoomRatio: Double?
    ): com.google.mlkit.vision.barcode.ZoomSuggestionOptions {
        val builder = com.google.mlkit.vision.barcode.ZoomSuggestionOptions.Builder(zoomCallback)
        if (maxSupportedZoomRatio != null) {
            builder.setMaxSupportedZoomRatio(maxSupportedZoomRatio.toFloat())
        }
        return builder.build()
    }

    class ZoomCallback(registrar: CameraXRegistrar) : PigeonApiZoomCallback(registrar) {
        override fun pigeon_defaultConstructor(): com.google.mlkit.vision.barcode.ZoomSuggestionOptions.ZoomCallback {
            return Impl(this)
        }

        class Impl(private val api: ZoomCallback) : com.google.mlkit.vision.barcode.ZoomSuggestionOptions.ZoomCallback {
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