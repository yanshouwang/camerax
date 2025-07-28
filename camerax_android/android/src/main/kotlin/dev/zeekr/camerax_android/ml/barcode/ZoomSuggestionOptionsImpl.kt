package dev.zeekr.camerax_android.ml.barcode

import com.google.mlkit.vision.barcode.ZoomSuggestionOptions
import dev.zeekr.camerax_android.CameraXImpl
import dev.zeekr.camerax_android.PigeonApiZoomCallbackApi
import dev.zeekr.camerax_android.PigeonApiZoomSuggestionOptionsApi
import kotlinx.coroutines.runBlocking
import kotlin.coroutines.suspendCoroutine

class ZoomSuggestionOptionsImpl(impl: CameraXImpl) : PigeonApiZoomSuggestionOptionsApi(impl) {
    override fun build(
        zoomCallback: ZoomSuggestionOptions.ZoomCallback, maxSupportedZoomRatio: Double?
    ): ZoomSuggestionOptions {
        val builder = ZoomSuggestionOptions.Builder(zoomCallback)
        if (maxSupportedZoomRatio != null) {
            builder.setMaxSupportedZoomRatio(maxSupportedZoomRatio.toFloat())
        }
        return builder.build()
    }

    class ZoomCallbackImpl(impl: CameraXImpl) : PigeonApiZoomCallbackApi(impl) {
        override fun pigeon_defaultConstructor(): ZoomSuggestionOptions.ZoomCallback {
            return object : ZoomSuggestionOptions.ZoomCallback {
                override fun setZoom(zoomRatio: Float): Boolean {
                    return runBlocking { setZoomAsync(zoomRatio) }
                }

                private suspend fun setZoomAsync(zoomRatio: Float): Boolean {
                    return suspendCoroutine { continuation ->
                        setZoom(this, zoomRatio.toDouble()) { result ->
                            continuation.resumeWith(result)
                        }
                    }
                }
            }
        }
    }
}