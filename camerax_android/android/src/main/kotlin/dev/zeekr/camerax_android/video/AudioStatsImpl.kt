package dev.zeekr.camerax_android.video

import androidx.camera.video.AudioStats
import dev.zeekr.camerax_android.AudioStatsAudioStateApi
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiAudioStatsProxyApi
import dev.zeekr.camerax_android.PigeonApiAudioStatsUtilProxyApi
import dev.zeekr.camerax_android.common.api

class AudioStatsImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiAudioStatsProxyApi(registrar) {
    class UtilImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiAudioStatsUtilProxyApi(registrar) {
        override fun fromAudioState(value: Long): AudioStatsAudioStateApi {
            return Util.fromAudioState(value.toInt())
        }

        override fun toAudioState(api: AudioStatsAudioStateApi): Long {
            return Util.toAudioState(api).toLong()
        }
    }

    object Util {
        fun fromAudioState(value: Int): AudioStatsAudioStateApi {
            return when (value) {
                AudioStats.AUDIO_STATE_ACTIVE -> AudioStatsAudioStateApi.ACTIVE
                AudioStats.AUDIO_STATE_DISABLED -> AudioStatsAudioStateApi.DISABLED
                AudioStats.AUDIO_STATE_SOURCE_SILENCED -> AudioStatsAudioStateApi.SOURCE_SILENCED
                AudioStats.AUDIO_STATE_ENCODER_ERROR -> AudioStatsAudioStateApi.ENCODER_ERROR
                AudioStats.AUDIO_STATE_SOURCE_ERROR -> AudioStatsAudioStateApi.SOURCE_ERROR
                AudioStats.AUDIO_STATE_MUTED -> AudioStatsAudioStateApi.MUTED
                else -> throw NotImplementedError("Not implemented value: $this")
            }
        }

        fun toAudioState(api: AudioStatsAudioStateApi): Int {
            return when (api) {
                AudioStatsAudioStateApi.ACTIVE -> AudioStats.AUDIO_STATE_ACTIVE
                AudioStatsAudioStateApi.DISABLED -> AudioStats.AUDIO_STATE_DISABLED
                AudioStatsAudioStateApi.SOURCE_SILENCED -> AudioStats.AUDIO_STATE_SOURCE_SILENCED
                AudioStatsAudioStateApi.ENCODER_ERROR -> AudioStats.AUDIO_STATE_ENCODER_ERROR
                AudioStatsAudioStateApi.SOURCE_ERROR -> AudioStats.AUDIO_STATE_SOURCE_ERROR
                AudioStatsAudioStateApi.MUTED -> AudioStats.AUDIO_STATE_MUTED
            }
        }
    }

    override fun audioAmplitude(pigeon_instance: AudioStats): Double {
        return pigeon_instance.audioAmplitude
    }

    override fun audioState(pigeon_instance: AudioStats): Long {
        return pigeon_instance.audioState.toLong()
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
