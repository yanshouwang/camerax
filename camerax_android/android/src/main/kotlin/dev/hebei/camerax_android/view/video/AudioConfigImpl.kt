package dev.hebei.camerax_android.view.video

import androidx.camera.view.video.AudioConfig
import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.PigeonApiAudioConfigApi

class AudioConfigImpl(impl: CameraXImpl) : PigeonApiAudioConfigApi(impl) {
    override fun create(enableAudio: Boolean): AudioConfig {
        return AudioConfig.create(enableAudio)
    }

    override fun audioDisabled(): AudioConfig {
        return AudioConfig.AUDIO_DISABLED
    }

    override fun getAudioEnabled(pigeon_instance: AudioConfig): Boolean {
        return pigeon_instance.audioEnabled
    }
}