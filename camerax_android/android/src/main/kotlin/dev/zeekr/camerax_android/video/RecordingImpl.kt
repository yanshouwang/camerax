package dev.zeekr.camerax_android.video

import androidx.camera.video.Recording
import dev.zeekr.camerax_android.CameraXImpl
import dev.zeekr.camerax_android.PigeonApiRecordingApi

class RecordingImpl(impl: CameraXImpl) : PigeonApiRecordingApi(impl) {
    @androidx.camera.video.ExperimentalPersistentRecording
    override fun isPersistent(pigeon_instance: Recording): Boolean {
        return pigeon_instance.isPersistent
    }

    override fun mute(pigeon_instance: Recording, muted: Boolean) {
        return pigeon_instance.mute(muted)
    }

    override fun pause(pigeon_instance: Recording) {
        return pigeon_instance.pause()
    }

    override fun resume(pigeon_instance: Recording) {
        return pigeon_instance.resume()
    }

    override fun stop(pigeon_instance: Recording) {
        return pigeon_instance.stop()
    }
}