package dev.zeekr.camerax_android.core

import androidx.camera.core.MirrorMode
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.MirrorModeApi
import dev.zeekr.camerax_android.PigeonApiMirrorModeUtilProxyApi

class MirrorModeImpl {
    class UtilImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiMirrorModeUtilProxyApi(registrar) {
        override fun fromMirrorMode(value: Long): MirrorModeApi {
            return Util.fromMirrorMode(value.toInt())
        }

        override fun toMirrorMode(api: MirrorModeApi): Long {
            return Util.toMirrorMode(api).toLong()
        }
    }

    object Util {
        fun fromMirrorMode(value: Int): MirrorModeApi {
            return when (value) {
                MirrorMode.MIRROR_MODE_OFF -> MirrorModeApi.OFF
                MirrorMode.MIRROR_MODE_ON -> MirrorModeApi.ON
                MirrorMode.MIRROR_MODE_ON_FRONT_ONLY -> MirrorModeApi.ON_FRONT_ONLY
                else -> throw NotImplementedError("Not implemented value: $this")
            }
        }

        fun toMirrorMode(api: MirrorModeApi): Int {
            return when (api) {
                MirrorModeApi.OFF -> MirrorMode.MIRROR_MODE_OFF
                MirrorModeApi.ON -> MirrorMode.MIRROR_MODE_ON
                MirrorModeApi.ON_FRONT_ONLY -> MirrorMode.MIRROR_MODE_ON_FRONT_ONLY
            }
        }
    }
}
