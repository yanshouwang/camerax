package dev.zeekr.camerax_android.video

import androidx.camera.video.OutputOptions
import androidx.camera.video.OutputResults
import androidx.camera.video.RecordingStats
import androidx.camera.video.VideoRecordEvent
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiVideoRecordEventProxyApi
import dev.zeekr.camerax_android.PigeonApiVideoRecordFinalizeEventProxyApi
import dev.zeekr.camerax_android.PigeonApiVideoRecordPauseEventProxyApi
import dev.zeekr.camerax_android.PigeonApiVideoRecordResumeEventProxyApi
import dev.zeekr.camerax_android.PigeonApiVideoRecordStartEventProxyApi
import dev.zeekr.camerax_android.PigeonApiVideoRecordStatusEventProxyApi
import dev.zeekr.camerax_android.VideoRecordFinalizeEventErrorApi
import dev.zeekr.camerax_android.common.api

class VideoRecordEventImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiVideoRecordEventProxyApi(registrar) {
    class StatusImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
        PigeonApiVideoRecordStatusEventProxyApi(registrar) {
        override fun outputOptions(pigeon_instance: VideoRecordEvent.Status): OutputOptions {
            return pigeon_instance.outputOptions
        }

        override fun recordingStats(pigeon_instance: VideoRecordEvent.Status): RecordingStats {
            return pigeon_instance.recordingStats
        }
    }

    class StartImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiVideoRecordStartEventProxyApi(registrar) {
        override fun outputOptions(pigeon_instance: VideoRecordEvent.Start): OutputOptions {
            return pigeon_instance.outputOptions
        }

        override fun recordingStats(pigeon_instance: VideoRecordEvent.Start): RecordingStats {
            return pigeon_instance.recordingStats
        }
    }

    class PauseImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiVideoRecordPauseEventProxyApi(registrar) {
        override fun outputOptions(pigeon_instance: VideoRecordEvent.Pause): OutputOptions {
            return pigeon_instance.outputOptions
        }

        override fun recordingStats(pigeon_instance: VideoRecordEvent.Pause): RecordingStats {
            return pigeon_instance.recordingStats
        }
    }

    class ResumeImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
        PigeonApiVideoRecordResumeEventProxyApi(registrar) {
        override fun outputOptions(pigeon_instance: VideoRecordEvent.Resume): OutputOptions {
            return pigeon_instance.outputOptions
        }

        override fun recordingStats(pigeon_instance: VideoRecordEvent.Resume): RecordingStats {
            return pigeon_instance.recordingStats
        }
    }

    class FinalizeImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
        PigeonApiVideoRecordFinalizeEventProxyApi(registrar) {
        override fun outputOptions(pigeon_instance: VideoRecordEvent.Finalize): OutputOptions {
            return pigeon_instance.outputOptions
        }

        override fun recordingStats(pigeon_instance: VideoRecordEvent.Finalize): RecordingStats {
            return pigeon_instance.recordingStats
        }

        override fun cause(pigeon_instance: VideoRecordEvent.Finalize): List<Any?>? {
            return pigeon_instance.cause?.api
        }

        override fun error(pigeon_instance: VideoRecordEvent.Finalize): VideoRecordFinalizeEventErrorApi {
            return pigeon_instance.error.videoRecordFinalizeEventErrorApi
        }

        override fun outputResults(pigeon_instance: VideoRecordEvent.Finalize): OutputResults {
            return pigeon_instance.outputResults
        }

        override fun hasError(pigeon_instance: VideoRecordEvent.Finalize): Boolean {
            return pigeon_instance.hasError()
        }
    }
}

val Int.videoRecordFinalizeEventErrorApi: VideoRecordFinalizeEventErrorApi
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
        else -> throw NotImplementedError("Not implemented value: $this")
    }