package dev.zeekr.camerax_android.camera2.interop

import androidx.camera.camera2.interop.CaptureRequestOptions
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiCaptureRequestOptionsBuilderProxyApi
import dev.zeekr.camerax_android.camera2.CaptureRequestImpl

class CaptureRequestOptionsImpl {
    class BuilderImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
        PigeonApiCaptureRequestOptionsBuilderProxyApi(registrar) {
        override fun pigeon_defaultConstructor(): CaptureRequestOptions.Builder {
            return CaptureRequestOptions.Builder()
        }

        override fun setIntCaptureRequestOption(
            pigeon_instance: CaptureRequestOptions.Builder, key: CaptureRequestImpl.IntKey, value: Long
        ): CaptureRequestOptions.Builder {
            return pigeon_instance.setCaptureRequestOption(key.instance, value.toInt())
        }

        override fun setLongCaptureRequestOption(
            pigeon_instance: CaptureRequestOptions.Builder, key: CaptureRequestImpl.LongKey, value: Long
        ): CaptureRequestOptions.Builder {
            return pigeon_instance.setCaptureRequestOption(key.instance, value)
        }

        override fun setFloatCaptureRequestOption(
            pigeon_instance: CaptureRequestOptions.Builder, key: CaptureRequestImpl.FloatKey, value: Double
        ): CaptureRequestOptions.Builder {
            return pigeon_instance.setCaptureRequestOption(key.instance, value.toFloat())
        }

        override fun setBooleanCaptureRequestOption(
            pigeon_instance: CaptureRequestOptions.Builder, key: CaptureRequestImpl.BooleanKey, value: Boolean
        ): CaptureRequestOptions.Builder {
            return pigeon_instance.setCaptureRequestOption(key.instance, value)
        }

        override fun build(pigeon_instance: CaptureRequestOptions.Builder): CaptureRequestOptions {
            return pigeon_instance.build()
        }
    }
}