package dev.zeekr.camerax_android.core

import androidx.camera.core.FlashState
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.FlashStateApi
import dev.zeekr.camerax_android.PigeonApiFlashStateUtilProxyApi

class FlashStateImpl {
    class UtilImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiFlashStateUtilProxyApi(registrar) {
        override fun fromFlashState(value: Long): FlashStateApi {
            return Util.fromFlashState(value.toInt())
        }

        override fun toFlashState(api: FlashStateApi): Long {
            return Util.toFlashState(api).toLong()
        }
    }

    object Util {
        fun fromFlashState(value: Int): FlashStateApi {
            return when (value) {
                FlashState.UNKNOWN -> FlashStateApi.UNKNOWN
                FlashState.FIRED -> FlashStateApi.FIRED
                FlashState.UNAVAILABLE -> FlashStateApi.UNAVAILABLE
                FlashState.NOT_FIRED -> FlashStateApi.NOT_FIRED
                else -> throw NotImplementedError("Not implemented value: $this")
            }
        }

        fun toFlashState(api: FlashStateApi): Int {
            return when (api) {
                FlashStateApi.UNKNOWN -> FlashState.UNKNOWN
                FlashStateApi.FIRED -> FlashState.FIRED
                FlashStateApi.UNAVAILABLE -> FlashState.UNAVAILABLE
                FlashStateApi.NOT_FIRED -> FlashState.NOT_FIRED
            }
        }
    }
}
