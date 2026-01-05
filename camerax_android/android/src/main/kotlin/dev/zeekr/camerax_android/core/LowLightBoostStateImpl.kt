package dev.zeekr.camerax_android.core

import androidx.camera.core.LowLightBoostState
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.LowLightBoostStateApi
import dev.zeekr.camerax_android.PigeonApiLowLightBoostStateUtilProxyApi

class LowLightBoostStateImpl {
    class UtilImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiLowLightBoostStateUtilProxyApi(registrar) {
        override fun fromLowLightBoostState(value: Long): LowLightBoostStateApi {
            return Util.fromLowLigthBoostState(value.toInt())
        }

        override fun toLowLightBoostState(api: LowLightBoostStateApi): Long {
            return Util.toLowLigthBoostState(api).toLong()
        }
    }

    object Util {
        fun fromLowLigthBoostState(value: Int): LowLightBoostStateApi {
            return when (value) {
                LowLightBoostState.OFF -> LowLightBoostStateApi.OFF
                LowLightBoostState.INACTIVE -> LowLightBoostStateApi.INACTIVE
                LowLightBoostState.ACTIVE -> LowLightBoostStateApi.ACTIVE
                else -> throw NotImplementedError("Not implemented value: $this")
            }
        }

        fun toLowLigthBoostState(api: LowLightBoostStateApi): Int {
            return when (api) {
                LowLightBoostStateApi.OFF -> LowLightBoostState.OFF
                LowLightBoostStateApi.INACTIVE -> LowLightBoostState.INACTIVE
                LowLightBoostStateApi.ACTIVE -> LowLightBoostState.ACTIVE
            }
        }
    }
}
