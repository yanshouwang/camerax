package dev.hebei.camerax_android.video

class Recording internal constructor(internal val obj: androidx.camera.video.Recording) {
    val isPersistent
        @androidx.camera.video.ExperimentalPersistentRecording get() = obj.isPersistent

    fun mute(muted: Boolean) {
        obj.mute(muted)
    }

    fun pause() {
        obj.pause()
    }

    fun resume() {
        obj.resume()
    }

    fun stop() {
        obj.stop()
    }

    fun close() {
        obj.close()
    }
}