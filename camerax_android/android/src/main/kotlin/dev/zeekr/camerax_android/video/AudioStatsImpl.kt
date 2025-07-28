package dev.zeekr.camerax_android.video

import androidx.camera.video.AudioStats
import dev.zeekr.camerax_android.AudioStateApi
import dev.zeekr.camerax_android.CameraXImpl
import dev.zeekr.camerax_android.PigeonApiAudioStatsApi
import dev.zeekr.camerax_android.common.api

class AudioStatsImpl(impl: CameraXImpl) : PigeonApiAudioStatsApi(impl) {
    override fun audioAmplitude(pigeon_instance: AudioStats): Double {
        return pigeon_instance.audioAmplitude
    }

    override fun audioState(pigeon_instance: AudioStats): AudioStateApi {
        return pigeon_instance.audioState.audioStateApi
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

val Int.audioStateApi
    get() = when (this) {
        AudioStats.AUDIO_STATE_ACTIVE -> AudioStateApi.ACTIVE
        AudioStats.AUDIO_STATE_DISABLED -> AudioStateApi.DISABLED
        AudioStats.AUDIO_STATE_SOURCE_SILENCED -> AudioStateApi.SOURCE_SILENCED
        AudioStats.AUDIO_STATE_ENCODER_ERROR -> AudioStateApi.ENCODER_ERROR
        AudioStats.AUDIO_STATE_SOURCE_ERROR -> AudioStateApi.SOURCE_ERROR
        AudioStats.AUDIO_STATE_MUTED -> AudioStateApi.MUTED
        else -> throw IllegalArgumentException()
    }