package dev.hebei.camerax_android.video

class RecordingStats internal constructor(internal val obj: androidx.camera.video.RecordingStats) {
    val audioStats get() = obj.audioStats
    val numBytesRecorded get() = obj.numBytesRecorded
    val recordedDurationNanos get() = obj.recordedDurationNanos
}