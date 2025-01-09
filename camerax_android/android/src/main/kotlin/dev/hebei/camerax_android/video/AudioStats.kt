package dev.hebei.camerax_android.video

class AudioStats internal constructor(internal val obj: androidx.camera.video.AudioStats) {
    val audioAmplitude get() = obj.audioAmplitude
    val audioState get() = obj.audioState.audioStateArgs
    val errorCause get() = obj.errorCause

    fun hasAudio(): Boolean {
        return obj.hasAudio()
    }

    fun hasError(): Boolean {
        return obj.hasError()
    }

    enum class AudioState {
        ACTIVE, DISABLED, SOURCE_SILENCED, ENCODER_ERROR, SOURCE_ERROR, MUTED,
    }
}

val Int.audioStateArgs
    get() = when (this) {
        androidx.camera.video.AudioStats.AUDIO_STATE_ACTIVE -> AudioStats.AudioState.ACTIVE
        androidx.camera.video.AudioStats.AUDIO_STATE_DISABLED -> AudioStats.AudioState.DISABLED
        androidx.camera.video.AudioStats.AUDIO_STATE_SOURCE_SILENCED -> AudioStats.AudioState.SOURCE_SILENCED
        androidx.camera.video.AudioStats.AUDIO_STATE_ENCODER_ERROR -> AudioStats.AudioState.ENCODER_ERROR
        androidx.camera.video.AudioStats.AUDIO_STATE_SOURCE_ERROR -> AudioStats.AudioState.SOURCE_ERROR
        androidx.camera.video.AudioStats.AUDIO_STATE_MUTED -> AudioStats.AudioState.MUTED
        else -> throw TypeCastException()
    }