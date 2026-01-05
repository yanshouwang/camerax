package dev.zeekr.camerax_android.core

import androidx.camera.core.TorchState
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiTorchStateUtilProxyApi
import dev.zeekr.camerax_android.TorchStateApi

class TorchStateImpl {
    class UtilImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiTorchStateUtilProxyApi(registrar) {
        override fun fromTorchState(value: Long): TorchStateApi {
            return Util.fromTorchState(value.toInt())
        }

        override fun toTorchState(api: TorchStateApi): Long {
            return Util.toTorchState(api).toLong()
        }
    }

    object Util {
        fun fromTorchState(value: Int): TorchStateApi {
            return when (value) {
                TorchState.OFF -> TorchStateApi.OFF
                TorchState.ON -> TorchStateApi.ON
                else -> throw NotImplementedError("Not implemented value: $this")
            }
        }

        fun toTorchState(api: TorchStateApi): Int {
            return when (api) {
                TorchStateApi.OFF -> TorchState.OFF
                TorchStateApi.ON -> TorchState.ON
            }
        }
    }
}
