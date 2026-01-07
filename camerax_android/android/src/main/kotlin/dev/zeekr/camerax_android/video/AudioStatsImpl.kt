package dev.zeekr.camerax_android.video

import androidx.camera.video.AudioStats
import dev.zeekr.camerax_android.AudioStatsAudioStateApi
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiAudioStatsProxyApi
import dev.zeekr.camerax_android.common.api

class AudioStatsImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiAudioStatsProxyApi(registrar) {
    override fun audioAmplitude(pigeon_instance: AudioStats): Double {
        return pigeon_instance.audioAmplitude
    }

    override fun audioState(pigeon_instance: AudioStats): AudioStatsAudioStateApi {
        return pigeon_instance.audioState.audioStatsAudioStateApi
    }

    override fun errorCause(pigeon_instance: AudioStats): List<Any?>? {
        return pigeon_instance.errorCause?.api
    }

    override fun hasAudio(pigeon_instance: AudioStats): Boolean {
        return pigeon_instance.hasAudio()
    }

    override fun hasError(pigeon_instance: AudioStats): Boolean {
        return pigeon_instance.hasError()
    }
}

val Int.audioStatsAudioStateApi: AudioStatsAudioStateApi
    get() = when (this) {
        AudioStats.AUDIO_STATE_ACTIVE -> AudioStatsAudioStateApi.ACTIVE
        AudioStats.AUDIO_STATE_DISABLED -> AudioStatsAudioStateApi.DISABLED
        AudioStats.AUDIO_STATE_SOURCE_SILENCED -> AudioStatsAudioStateApi.SOURCE_SILENCED
        AudioStats.AUDIO_STATE_ENCODER_ERROR -> AudioStatsAudioStateApi.ENCODER_ERROR
        AudioStats.AUDIO_STATE_SOURCE_ERROR -> AudioStatsAudioStateApi.SOURCE_ERROR
        AudioStats.AUDIO_STATE_MUTED -> AudioStatsAudioStateApi.MUTED
        else -> throw NotImplementedError("Not implemented value: $this")
    }

val AudioStatsAudioStateApi.impl: Int
    get() = when (this) {
        AudioStatsAudioStateApi.ACTIVE -> AudioStats.AUDIO_STATE_ACTIVE
        AudioStatsAudioStateApi.DISABLED -> AudioStats.AUDIO_STATE_DISABLED
        AudioStatsAudioStateApi.SOURCE_SILENCED -> AudioStats.AUDIO_STATE_SOURCE_SILENCED
        AudioStatsAudioStateApi.ENCODER_ERROR -> AudioStats.AUDIO_STATE_ENCODER_ERROR
        AudioStatsAudioStateApi.SOURCE_ERROR -> AudioStats.AUDIO_STATE_SOURCE_ERROR
        AudioStatsAudioStateApi.MUTED -> AudioStats.AUDIO_STATE_MUTED
    }
