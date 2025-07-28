package dev.zeekr.camerax_android.video

import androidx.camera.video.OutputResults
import androidx.camera.video.RecordingStats
import androidx.camera.video.VideoRecordEvent
import dev.zeekr.camerax_android.CameraXImpl
import dev.zeekr.camerax_android.PigeonApiVideoRecordEventApi
import dev.zeekr.camerax_android.PigeonApiVideoRecordFinalizeEventApi
import dev.zeekr.camerax_android.PigeonApiVideoRecordPauseEventApi
import dev.zeekr.camerax_android.PigeonApiVideoRecordResumeEventApi
import dev.zeekr.camerax_android.PigeonApiVideoRecordStartEventApi
import dev.zeekr.camerax_android.PigeonApiVideoRecordStatusEventApi
import dev.zeekr.camerax_android.VideoRecordFinalizeEventErrorApi
import dev.zeekr.camerax_android.common.api

class VideoRecordEventImpl(impl: CameraXImpl) : PigeonApiVideoRecordEventApi(impl) {
    class StatusImpl(impl: CameraXImpl) : PigeonApiVideoRecordStatusEventApi(impl) {
        override fun recordingStats(pigeon_instance: VideoRecordEvent.Status): RecordingStats {
            return pigeon_instance.recordingStats
        }
    }

    class StartImpl(impl: CameraXImpl) : PigeonApiVideoRecordStartEventApi(impl) {
        override fun recordingStats(pigeon_instance: VideoRecordEvent.Start): RecordingStats {
            return pigeon_instance.recordingStats
        }
    }

    class PauseImpl(impl: CameraXImpl) : PigeonApiVideoRecordPauseEventApi(impl) {
        override fun recordingStats(pigeon_instance: VideoRecordEvent.Pause): RecordingStats {
            return pigeon_instance.recordingStats
        }
    }

    class ResumeImpl(impl: CameraXImpl) : PigeonApiVideoRecordResumeEventApi(impl) {
        override fun recordingStats(pigeon_instance: VideoRecordEvent.Resume): RecordingStats {
            return pigeon_instance.recordingStats
        }
    }

    class FinalizeImpl(impl: CameraXImpl) : PigeonApiVideoRecordFinalizeEventApi(impl) {
        override fun recordingStats(pigeon_instance: VideoRecordEvent.Finalize): RecordingStats {
            return pigeon_instance.recordingStats
        }

        override fun cause(pigeon_instance: VideoRecordEvent.Finalize): List<Any?>? {
            return pigeon_instance.cause?.api
        }

        override fun error(pigeon_instance: VideoRecordEvent.Finalize): VideoRecordFinalizeEventErrorApi {
            return pigeon_instance.error.finalizeErrorApi
        }

        override fun outputResults(pigeon_instance: VideoRecordEvent.Finalize): OutputResults {
            return pigeon_instance.outputResults
        }
    }
}

val Int.finalizeErrorApi
    get() = when (this) {
        VideoRecordEvent.Finalize.ERROR_NONE -> VideoRecordFinalizeEventErrorApi.NONE
        VideoRecordEvent.Finalize.ERROR_UNKNOWN -> VideoRecordFinalizeEventErrorApi.UNKNOWN
        VideoRecordEvent.Finalize.ERROR_FILE_SIZE_LIMIT_REACHED -> VideoRecordFinalizeEventErrorApi.FILE_SIZE_LIMIT_REACHED
        VideoRecordEvent.Finalize.ERROR_INSUFFICIENT_STORAGE -> VideoRecordFinalizeEventErrorApi.INSUFFICIENT_STORAGE
        VideoRecordEvent.Finalize.ERROR_SOURCE_INACTIVE -> VideoRecordFinalizeEventErrorApi.SOURCE_INACTIVE
        VideoRecordEvent.Finalize.ERROR_INVALID_OUTPUT_OPTIONS -> VideoRecordFinalizeEventErrorApi.INVALID_OUPUT_OPTIONS
        VideoRecordEvent.Finalize.ERROR_ENCODING_FAILED -> VideoRecordFinalizeEventErrorApi.ENCODING_FAILED
        VideoRecordEvent.Finalize.ERROR_RECORDER_ERROR -> VideoRecordFinalizeEventErrorApi.RECORDER_ERROR
        VideoRecordEvent.Finalize.ERROR_NO_VALID_DATA -> VideoRecordFinalizeEventErrorApi.NO_VALID_DATA
        VideoRecordEvent.Finalize.ERROR_DURATION_LIMIT_REACHED -> VideoRecordFinalizeEventErrorApi.DURATION_LIMIT_REACHED
        VideoRecordEvent.Finalize.ERROR_RECORDING_GARBAGE_COLLECTED -> VideoRecordFinalizeEventErrorApi.RECORDING_GARBAGE_COLLECTED
        else -> throw IllegalArgumentException()
    }