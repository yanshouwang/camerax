package dev.hebei.camerax_android.legacy.view.video

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiAudioConfig

class AudioConfig(registrar: CameraXRegistrar) : PigeonApiAudioConfig(registrar) {
    override fun create(enableAudio: Boolean): androidx.camera.view.video.AudioConfig {
        return androidx.camera.view.video.AudioConfig.create(enableAudio)
    }

    override fun audioDisabled(): androidx.camera.view.video.AudioConfig {
        return androidx.camera.view.video.AudioConfig.AUDIO_DISABLED
    }
}