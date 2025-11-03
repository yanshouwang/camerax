package dev.zeekr.camerax_android.video

import androidx.camera.video.Quality
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiQualityApi

class QualityImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiQualityApi(registrar) {
    override fun fhd(): Quality {
        return Quality.FHD
    }

    override fun hd(): Quality {
        return Quality.HD
    }

    override fun highest(): Quality {
        return Quality.HIGHEST
    }

    override fun lowest(): Quality {
        return Quality.LOWEST
    }

    override fun sd(): Quality {
        return Quality.SD
    }

    override fun uhd(): Quality {
        return Quality.UHD
    }
}