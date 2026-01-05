package dev.zeekr.camerax_android.core

import androidx.camera.core.AspectRatio
import dev.zeekr.camerax_android.AspectRatioApi
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiAspectRatioUtilProxyApi

class AspectRatioImpl {
    class UtilImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiAspectRatioUtilProxyApi(registrar) {
        override fun fromAspectRatio(value: Long): AspectRatioApi {
            return Util.fromAspectRatio(value.toInt())
        }

        override fun toAspectRatio(api: AspectRatioApi): Long {
            return Util.toAspectRatio(api).toLong()
        }
    }

    object Util {
        fun fromAspectRatio(value: Int): AspectRatioApi {
            return when (value) {
                AspectRatio.RATIO_DEFAULT -> AspectRatioApi.RATIO_DEFAULT
                AspectRatio.RATIO_4_3 -> AspectRatioApi.RATIO4_3
                AspectRatio.RATIO_16_9 -> AspectRatioApi.RATIO16_9
                else -> throw IllegalArgumentException()
            }
        }

        fun toAspectRatio(api: AspectRatioApi): Int {
            return when (api) {
                AspectRatioApi.RATIO_DEFAULT -> AspectRatio.RATIO_DEFAULT
                AspectRatioApi.RATIO4_3 -> AspectRatio.RATIO_4_3
                AspectRatioApi.RATIO16_9 -> AspectRatio.RATIO_16_9
            }
        }
    }
}
