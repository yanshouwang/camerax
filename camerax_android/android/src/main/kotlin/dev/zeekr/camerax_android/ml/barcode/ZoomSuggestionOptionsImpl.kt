package dev.zeekr.camerax_android.ml.barcode

import com.google.mlkit.vision.barcode.ZoomSuggestionOptions
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiZoomSuggestionOptionsProxyApi
import dev.zeekr.camerax_android.PigeonApiZoomSuggestionOptionsZoomCallbackProxyApi
import kotlinx.coroutines.runBlocking
import kotlin.coroutines.suspendCoroutine

class ZoomSuggestionOptionsImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiZoomSuggestionOptionsProxyApi(registrar) {
    override fun build(
        zoomCallback: ZoomSuggestionOptions.ZoomCallback, maxSupportedZoomRatio: Double?
    ): ZoomSuggestionOptions {
        val builder = ZoomSuggestionOptions.Builder(zoomCallback)
        if (maxSupportedZoomRatio != null) {
            builder.setMaxSupportedZoomRatio(maxSupportedZoomRatio.toFloat())
        }
        return builder.build()
    }

    class ZoomCallbackImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
        PigeonApiZoomSuggestionOptionsZoomCallbackProxyApi(registrar) {
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