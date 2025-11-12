package dev.zeekr.camerax_android.view.video

import android.Manifest
import androidx.annotation.RequiresPermission
import androidx.camera.view.video.AudioConfig
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiAudioConfigProxyApi

class AudioConfigImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiAudioConfigProxyApi(registrar) {
    @RequiresPermission(Manifest.permission.RECORD_AUDIO)
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