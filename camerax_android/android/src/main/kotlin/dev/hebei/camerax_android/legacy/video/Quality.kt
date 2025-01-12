package dev.hebei.camerax_android.legacy.video

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiQuality

class Quality(registrar: CameraXRegistrar) : PigeonApiQuality(registrar) {
    override fun fhd(): androidx.camera.video.Quality {
        return androidx.camera.video.Quality.FHD
    }

    override fun hd(): androidx.camera.video.Quality {
        return androidx.camera.video.Quality.HD
    }

    override fun highest(): androidx.camera.video.Quality {
        return androidx.camera.video.Quality.HIGHEST
    }

    override fun lowest(): androidx.camera.video.Quality {
        return androidx.camera.video.Quality.LOWEST
    }

    override fun sd(): androidx.camera.video.Quality {
        return androidx.camera.video.Quality.SD
    }

    override fun uhd(): androidx.camera.video.Quality {
        return androidx.camera.video.Quality.UHD
    }
}