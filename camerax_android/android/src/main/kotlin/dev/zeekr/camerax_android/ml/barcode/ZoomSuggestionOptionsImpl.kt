package dev.zeekr.camerax_android.ml.barcode

import com.google.android.gms.tasks.TaskCompletionSource
import com.google.mlkit.vision.barcode.ZoomSuggestionOptions
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiZoomSuggestionOptionsProxyApi
import dev.zeekr.camerax_android.PigeonApiZoomSuggestionOptionsZoomCallbackProxyApi

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
                    // TODO: It is impossible to convert async api to sync api
                    val tcs = TaskCompletionSource<Boolean>()
                    this@ZoomCallbackImpl.setZoom(this, zoomRatio.toDouble()) { res ->
                        try {
                            val ok = res.getOrThrow()
                            tcs.setResult(ok)
                        } catch (e: Exception) {
                            tcs.setException(e)
                        }
                    }
                    return tcs.task.result
                }
            }
        }
    }
}