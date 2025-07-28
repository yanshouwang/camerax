package dev.zeekr.camerax_android.video

import androidx.camera.video.AudioStats
import androidx.camera.video.RecordingStats
import dev.zeekr.camerax_android.CameraXImpl
import dev.zeekr.camerax_android.PigeonApiRecordingStatsApi

class RecordingStatsImpl(impl: CameraXImpl) : PigeonApiRecordingStatsApi(impl) {
    override fun audioStats(pigeon_instance: RecordingStats): AudioStats {
        return pigeon_instance.audioStats
    }

    override fun numBytesRecorded(pigeon_instance: RecordingStats): Long {
        return pigeon_instance.numBytesRecorded
    }

    override fun recordedDurationNanos(pigeon_instance: RecordingStats): Long {
        return pigeon_instance.recordedDurationNanos
    }
}