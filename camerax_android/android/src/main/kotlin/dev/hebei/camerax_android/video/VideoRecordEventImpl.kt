package dev.hebei.camerax_android.video

import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.PigeonApiVideoRecordEventApi
import dev.hebei.camerax_android.PigeonApiVideoRecordFinalizeEventApi
import dev.hebei.camerax_android.PigeonApiVideoRecordPauseEventApi
import dev.hebei.camerax_android.PigeonApiVideoRecordResumeEventApi
import dev.hebei.camerax_android.PigeonApiVideoRecordStartEventApi
import dev.hebei.camerax_android.PigeonApiVideoRecordStatusEventApi
import dev.hebei.camerax_android.VideoRecordFinalizeEventErrorApi
import dev.hebei.camerax_android.common.api

class VideoRecordEventImpl(impl: CameraXImpl) : PigeonApiVideoRecordEventApi(impl) {
    class StatusImpl(impl: CameraXImpl) : PigeonApiVideoRecordStatusEventApi(impl) {
        override fun recordingStats(pigeon_instance: androidx.camera.video.VideoRecordEvent.Status): androidx.camera.video.RecordingStats {
            return pigeon_instance.recordingStats
        }
    }

    class StartImpl(impl: CameraXImpl) : PigeonApiVideoRecordStartEventApi(impl) {
        override fun recordingStats(pigeon_instance: androidx.camera.video.VideoRecordEvent.Start): androidx.camera.video.RecordingStats {
            return pigeon_instance.recordingStats
        }
    }

    class PauseImpl(impl: CameraXImpl) : PigeonApiVideoRecordPauseEventApi(impl) {
        override fun recordingStats(pigeon_instance: androidx.camera.video.VideoRecordEvent.Pause): androidx.camera.video.RecordingStats {
            return pigeon_instance.recordingStats
        }
    }

    class ResumeImpl(impl: CameraXImpl) : PigeonApiVideoRecordResumeEventApi(impl) {
        override fun recordingStats(pigeon_instance: androidx.camera.video.VideoRecordEvent.Resume): androidx.camera.video.RecordingStats {
            return pigeon_instance.recordingStats
        }
    }

    class FinalizeImpl(impl: CameraXImpl) : PigeonApiVideoRecordFinalizeEventApi(impl) {
        override fun recordingStats(pigeon_instance: androidx.camera.video.VideoRecordEvent.Finalize): androidx.camera.video.RecordingStats {
            return pigeon_instance.recordingStats
        }

        override fun cause(pigeon_instance: androidx.camera.video.VideoRecordEvent.Finalize): List<Any?>? {
            return pigeon_instance.cause?.api
        }

        override fun error(pigeon_instance: androidx.camera.video.VideoRecordEvent.Finalize): VideoRecordFinalizeEventErrorApi {
            return pigeon_instance.error.finalizeErrorApi
        }

        override fun outputResults(pigeon_instance: androidx.camera.video.VideoRecordEvent.Finalize): androidx.camera.video.OutputResults {
            return pigeon_instance.outputResults
        }
    }
}

val Int.finalizeErrorApi
    get() = when (this) {
        androidx.camera.video.VideoRecordEvent.Finalize.ERROR_NONE -> VideoRecordFinalizeEventErrorApi.NONE
        androidx.camera.video.VideoRecordEvent.Finalize.ERROR_UNKNOWN -> VideoRecordFinalizeEventErrorApi.UNKNOWN
        androidx.camera.video.VideoRecordEvent.Finalize.ERROR_FILE_SIZE_LIMIT_REACHED -> VideoRecordFinalizeEventErrorApi.FILE_SIZE_LIMIT_REACHED
        androidx.camera.video.VideoRecordEvent.Finalize.ERROR_INSUFFICIENT_STORAGE -> VideoRecordFinalizeEventErrorApi.INSUFFICIENT_STORAGE
        androidx.camera.video.VideoRecordEvent.Finalize.ERROR_SOURCE_INACTIVE -> VideoRecordFinalizeEventErrorApi.SOURCE_INACTIVE
        androidx.camera.video.VideoRecordEvent.Finalize.ERROR_INVALID_OUTPUT_OPTIONS -> VideoRecordFinalizeEventErrorApi.INVALID_OUPUT_OPTIONS
        androidx.camera.video.VideoRecordEvent.Finalize.ERROR_ENCODING_FAILED -> VideoRecordFinalizeEventErrorApi.ENCODING_FAILED
        androidx.camera.video.VideoRecordEvent.Finalize.ERROR_RECORDER_ERROR -> VideoRecordFinalizeEventErrorApi.RECORDER_ERROR
        androidx.camera.video.VideoRecordEvent.Finalize.ERROR_NO_VALID_DATA -> VideoRecordFinalizeEventErrorApi.NO_VALID_DATA
        androidx.camera.video.VideoRecordEvent.Finalize.ERROR_DURATION_LIMIT_REACHED -> VideoRecordFinalizeEventErrorApi.DURATION_LIMIT_REACHED
        androidx.camera.video.VideoRecordEvent.Finalize.ERROR_RECORDING_GARBAGE_COLLECTED -> VideoRecordFinalizeEventErrorApi.RECORDING_GARBAGE_COLLECTED
        else -> throw IllegalArgumentException()
    }