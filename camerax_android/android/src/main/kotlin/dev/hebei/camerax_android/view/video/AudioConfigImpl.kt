package dev.hebei.camerax_android.view.video

import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.PigeonApiAudioConfigApi

class AudioConfigImpl(impl: CameraXImpl) : PigeonApiAudioConfigApi(impl) {
    override fun create(enableAudio: Boolean): androidx.camera.view.video.AudioConfig {
        return androidx.camera.view.video.AudioConfig.create(enableAudio)
    }

    override fun audioDisabled(): androidx.camera.view.video.AudioConfig {
        return androidx.camera.view.video.AudioConfig.AUDIO_DISABLED
    }

    override fun getAudioEnabled(pigeon_instance: androidx.camera.view.video.AudioConfig): Boolean {
        return pigeon_instance.audioEnabled
    }
}