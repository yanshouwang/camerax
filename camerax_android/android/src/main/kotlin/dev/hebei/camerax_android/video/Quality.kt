package dev.hebei.camerax_android.video

class Quality internal constructor(internal val obj: androidx.camera.video.Quality) {
    companion object {
        val FHD get() = Quality(androidx.camera.video.Quality.FHD)
        val HD get() = Quality(androidx.camera.video.Quality.HD)
        val HIGHEST get() = Quality(androidx.camera.video.Quality.HIGHEST)
        val LOWEST get() = Quality(androidx.camera.video.Quality.LOWEST)
        val SD get() = Quality(androidx.camera.video.Quality.SD)
        val UHD get() = Quality(androidx.camera.video.Quality.UHD)
    }
}