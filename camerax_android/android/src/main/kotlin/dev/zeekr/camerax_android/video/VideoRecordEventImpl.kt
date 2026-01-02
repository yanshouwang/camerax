package dev.zeekr.camerax_android.video

import androidx.camera.video.OutputOptions
import androidx.camera.video.OutputResults
import androidx.camera.video.RecordingStats
import androidx.camera.video.VideoRecordEvent
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiVideoRecordEventFinalizeProxyApi
import dev.zeekr.camerax_android.PigeonApiVideoRecordEventPauseProxyApi
import dev.zeekr.camerax_android.PigeonApiVideoRecordEventProxyApi
import dev.zeekr.camerax_android.PigeonApiVideoRecordEventResumeProxyApi
import dev.zeekr.camerax_android.PigeonApiVideoRecordEventStartProxyApi
import dev.zeekr.camerax_android.PigeonApiVideoRecordEventStatusProxyApi
import dev.zeekr.camerax_android.VideoRecordEventFinalizeErrorApi
import dev.zeekr.camerax_android.common.api

class VideoRecordEventImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiVideoRecordEventProxyApi(registrar) {
    class StatusImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
        PigeonApiVideoRecordEventStatusProxyApi(registrar) {
        override fun outputOptions(pigeon_instance: VideoRecordEvent.Status): OutputOptions {
            return pigeon_instance.outputOptions
        }

        override fun recordingStats(pigeon_instance: VideoRecordEvent.Status): RecordingStats {
            return pigeon_instance.recordingStats
        }
    }

    class StartImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiVideoRecordEventStartProxyApi(registrar) {
        override fun outputOptions(pigeon_instance: VideoRecordEvent.Start): OutputOptions {
            return pigeon_instance.outputOptions
        }

        override fun recordingStats(pigeon_instance: VideoRecordEvent.Start): RecordingStats {
            return pigeon_instance.recordingStats
        }
    }

    class PauseImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiVideoRecordEventPauseProxyApi(registrar) {
        override fun outputOptions(pigeon_instance: VideoRecordEvent.Pause): OutputOptions {
            return pigeon_instance.outputOptions
        }

        override fun recordingStats(pigeon_instance: VideoRecordEvent.Pause): RecordingStats {
            return pigeon_instance.recordingStats
        }
    }

    class ResumeImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
        PigeonApiVideoRecordEventResumeProxyApi(registrar) {
        override fun outputOptions(pigeon_instance: VideoRecordEvent.Resume): OutputOptions {
            return pigeon_instance.outputOptions
        }

        override fun recordingStats(pigeon_instance: VideoRecordEvent.Resume): RecordingStats {
            return pigeon_instance.recordingStats
        }
    }

    class FinalizeImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
        PigeonApiVideoRecordEventFinalizeProxyApi(registrar) {
        override fun outputOptions(pigeon_instance: VideoRecordEvent.Finalize): OutputOptions {
            return pigeon_instance.outputOptions
        }

        override fun recordingStats(pigeon_instance: VideoRecordEvent.Finalize): RecordingStats {
            return pigeon_instance.recordingStats
        }

        override fun cause(pigeon_instance: VideoRecordEvent.Finalize): List<Any?>? {
            return pigeon_instance.cause?.api
        }

        override fun error(pigeon_instance: VideoRecordEvent.Finalize): VideoRecordEventFinalizeErrorApi {
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

val Int.videoRecordFinalizeEventErrorApi: VideoRecordEventFinalizeErrorApi
    get() = when (this) {
        VideoRecordEvent.Finalize.ERROR_NONE -> VideoRecordEventFinalizeErrorApi.NONE
        VideoRecordEvent.Finalize.ERROR_UNKNOWN -> VideoRecordEventFinalizeErrorApi.UNKNOWN
        VideoRecordEvent.Finalize.ERROR_FILE_SIZE_LIMIT_REACHED -> VideoRecordEventFinalizeErrorApi.FILE_SIZE_LIMIT_REACHED
        VideoRecordEvent.Finalize.ERROR_INSUFFICIENT_STORAGE -> VideoRecordEventFinalizeErrorApi.INSUFFICIENT_STORAGE
        VideoRecordEvent.Finalize.ERROR_SOURCE_INACTIVE -> VideoRecordEventFinalizeErrorApi.SOURCE_INACTIVE
        VideoRecordEvent.Finalize.ERROR_INVALID_OUTPUT_OPTIONS -> VideoRecordEventFinalizeErrorApi.INVALID_OUPUT_OPTIONS
        VideoRecordEvent.Finalize.ERROR_ENCODING_FAILED -> VideoRecordEventFinalizeErrorApi.ENCODING_FAILED
        VideoRecordEvent.Finalize.ERROR_RECORDER_ERROR -> VideoRecordEventFinalizeErrorApi.RECORDER_ERROR
        VideoRecordEvent.Finalize.ERROR_NO_VALID_DATA -> VideoRecordEventFinalizeErrorApi.NO_VALID_DATA
        VideoRecordEvent.Finalize.ERROR_DURATION_LIMIT_REACHED -> VideoRecordEventFinalizeErrorApi.DURATION_LIMIT_REACHED
        VideoRecordEvent.Finalize.ERROR_RECORDING_GARBAGE_COLLECTED -> VideoRecordEventFinalizeErrorApi.RECORDING_GARBAGE_COLLECTED
        else -> throw NotImplementedError("Not implemented value: $this")
    }