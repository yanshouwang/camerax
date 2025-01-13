package dev.hebei.camerax_android.legacy.video

import dev.hebei.camerax_android.legacy.AudioState
import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiAudioStats
import dev.hebei.camerax_android.legacy.common.args

class AudioStats(registrar: CameraXRegistrar) : PigeonApiAudioStats(registrar) {
    override fun audioAmplitude(pigeon_instance: androidx.camera.video.AudioStats): Double {
        return pigeon_instance.audioAmplitude
    }

    override fun audioState(pigeon_instance: androidx.camera.video.AudioStats): AudioState {
        return pigeon_instance.audioState.audioStateArgs
    }

    override fun errorCause(pigeon_instance: androidx.camera.video.AudioStats): List<Any?>? {
        val errorCause = pigeon_instance.errorCause
        return if (errorCause == null) null
        else errorCause.args
    }

    override fun hasAudio(pigeon_instance: androidx.camera.video.AudioStats): Boolean {
        return pigeon_instance.hasAudio()
    }

    override fun hasError(pigeon_instance: androidx.camera.video.AudioStats): Boolean {
        return pigeon_instance.hasError()
    }
}

val Int.audioStateArgs
    get() = when (this) {
        androidx.camera.video.AudioStats.AUDIO_STATE_ACTIVE -> AudioState.ACTIVE
        androidx.camera.video.AudioStats.AUDIO_STATE_DISABLED -> AudioState.DISABLED
        androidx.camera.video.AudioStats.AUDIO_STATE_SOURCE_SILENCED -> AudioState.SOURCE_SILENCED
        androidx.camera.video.AudioStats.AUDIO_STATE_ENCODER_ERROR -> AudioState.ENCODER_ERROR
        androidx.camera.video.AudioStats.AUDIO_STATE_SOURCE_ERROR -> AudioState.SOURCE_ERROR
        androidx.camera.video.AudioStats.AUDIO_STATE_MUTED -> AudioState.MUTED
        else -> throw IllegalArgumentException()
    }