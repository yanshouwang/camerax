package dev.hebei.camerax_android.video

import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.PigeonApiRecordingStatsApi

class RecordingStatsImpl(impl: CameraXImpl) : PigeonApiRecordingStatsApi(impl) {
    override fun audioStats(pigeon_instance: androidx.camera.video.RecordingStats): androidx.camera.video.AudioStats {
        return pigeon_instance.audioStats
    }

    override fun numBytesRecorded(pigeon_instance: androidx.camera.video.RecordingStats): Long {
        return pigeon_instance.numBytesRecorded
    }

    override fun recordedDurationNanos(pigeon_instance: androidx.camera.video.RecordingStats): Long {
        return pigeon_instance.recordedDurationNanos
    }
}