package dev.zeekr.camerax_android.ml.barcode

import com.google.android.gms.tasks.TaskCompletionSource
import com.google.mlkit.vision.barcode.ZoomSuggestionOptions
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiZoomSuggestionOptionsBuilderProxyApi
import dev.zeekr.camerax_android.PigeonApiZoomSuggestionOptionsProxyApi
import dev.zeekr.camerax_android.PigeonApiZoomSuggestionOptionsZoomCallbackProxyApi

class ZoomSuggestionOptionsImpl {
    class BuilderImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
        PigeonApiZoomSuggestionOptionsBuilderProxyApi(registrar) {
        override fun pigeon_defaultConstructor(zoomCallback: ZoomSuggestionOptions.ZoomCallback): ZoomSuggestionOptions.Builder {
            return ZoomSuggestionOptions.Builder(zoomCallback)
        }

        override fun setMaxSupportedZoomRatio(
            pigeon_instance: ZoomSuggestionOptions.Builder, maxSupportedZoomRatio: Double
        ): ZoomSuggestionOptions.Builder {
            return pigeon_instance.setMaxSupportedZoomRatio(maxSupportedZoomRatio.toFloat())
        }

        override fun build(pigeon_instance: ZoomSuggestionOptions.Builder): ZoomSuggestionOptions {
            return pigeon_instance.build()
        }
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