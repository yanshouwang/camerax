package dev.zeekr.camerax_android.common

import android.view.Surface
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiSurfaceUtilProxyApi
import dev.zeekr.camerax_android.SurfaceRotationApi

class SurfaceImpl {
    class UtilImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiSurfaceUtilProxyApi(registrar) {
        override fun fromRotation(value: Long): SurfaceRotationApi {
            return Util.fromRotation(value.toInt())
        }

        override fun toRotation(api: SurfaceRotationApi): Long {
            return Util.toRotation(api).toLong()
        }
    }

    object Util {
        fun fromRotation(value: Int): SurfaceRotationApi {
            return when (value) {
                Surface.ROTATION_0 -> SurfaceRotationApi.ROTATION0
                Surface.ROTATION_90 -> SurfaceRotationApi.ROTATION90
                Surface.ROTATION_180 -> SurfaceRotationApi.ROTATION180
                Surface.ROTATION_270 -> SurfaceRotationApi.ROTATION270
                else -> throw NotImplementedError("Not implemented value: $this")
            }
        }

        fun toRotation(api: SurfaceRotationApi): Int {
            return when (api) {
                SurfaceRotationApi.ROTATION0 -> Surface.ROTATION_0
                SurfaceRotationApi.ROTATION90 -> Surface.ROTATION_90
                SurfaceRotationApi.ROTATION180 -> Surface.ROTATION_180
                SurfaceRotationApi.ROTATION270 -> Surface.ROTATION_270
            }
        }
    }
}