package dev.hebei.camerax_android.legacy.video

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiRecordingStats

class RecordingStats(registrar: CameraXRegistrar) : PigeonApiRecordingStats(registrar) {
    override fun getAudioStats(pigeon_instance: androidx.camera.video.RecordingStats): androidx.camera.video.AudioStats {
        return pigeon_instance.audioStats
    }

    override fun getNumBytesRecorded(pigeon_instance: androidx.camera.video.RecordingStats): Long {
        return pigeon_instance.numBytesRecorded
    }

    override fun getRecordedDurationNanos(pigeon_instance: androidx.camera.video.RecordingStats): Long {
        return pigeon_instance.recordedDurationNanos
    }
}