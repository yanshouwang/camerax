package dev.hebei.camerax_android.legacy.video

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiRecording

class Recording(registrar: CameraXRegistrar) : PigeonApiRecording(registrar) {
    override fun isPersistene(pigeon_instance: androidx.camera.video.Recording): Boolean {
        return pigeon_instance.isPersistent
    }

    override fun mute(pigeon_instance: androidx.camera.video.Recording, muted: Boolean) {
        return pigeon_instance.mute(muted)
    }

    override fun pause(pigeon_instance: androidx.camera.video.Recording) {
        return pigeon_instance.pause()
    }

    override fun resume(pigeon_instance: androidx.camera.video.Recording) {
        return pigeon_instance.resume()
    }

    override fun stop(pigeon_instance: androidx.camera.video.Recording) {
        return pigeon_instance.stop()
    }

    override fun close(pigeon_instance: androidx.camera.video.Recording) {
        return pigeon_instance.close()
    }
}