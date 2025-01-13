package dev.hebei.camerax_android.legacy.video

import dev.hebei.camerax_android.legacy.*
import dev.hebei.camerax_android.legacy.common.args

class VideoRecordEvent(registrar: CameraXRegistrar) : PigeonApiVideoRecordEvent(registrar) {
    class Status(registrar: CameraXRegistrar) : PigeonApiVideoRecordStatusEvent(registrar) {
        override fun recordingStats(pigeon_instance: androidx.camera.video.VideoRecordEvent.Status): androidx.camera.video.RecordingStats {
            return pigeon_instance.recordingStats
        }
    }

    class Start(registrar: CameraXRegistrar) : PigeonApiVideoRecordStartEvent(registrar) {
        override fun recordingStats(pigeon_instance: androidx.camera.video.VideoRecordEvent.Start): androidx.camera.video.RecordingStats {
            return pigeon_instance.recordingStats
        }
    }

    class Pause(registrar: CameraXRegistrar) : PigeonApiVideoRecordPauseEvent(registrar) {
        override fun recordingStats(pigeon_instance: androidx.camera.video.VideoRecordEvent.Pause): androidx.camera.video.RecordingStats {
            return pigeon_instance.recordingStats
        }
    }

    class Resume(registrar: CameraXRegistrar) : PigeonApiVideoRecordResumeEvent(registrar) {
        override fun recordingStats(pigeon_instance: androidx.camera.video.VideoRecordEvent.Resume): androidx.camera.video.RecordingStats {
            return pigeon_instance.recordingStats
        }
    }

    class Finalize(registrar: CameraXRegistrar) : PigeonApiVideoRecordFinalizeEvent(registrar) {
        override fun recordingStats(pigeon_instance: androidx.camera.video.VideoRecordEvent.Finalize): androidx.camera.video.RecordingStats {
            return pigeon_instance.recordingStats
        }

        override fun cause(pigeon_instance: androidx.camera.video.VideoRecordEvent.Finalize): List<Any?>? {
            return pigeon_instance.cause?.args
        }

        override fun error(pigeon_instance: androidx.camera.video.VideoRecordEvent.Finalize): VideoRecordFinalizeEventError {
            return pigeon_instance.error.finalizeErrorArgs
        }

        override fun outputResults(pigeon_instance: androidx.camera.video.VideoRecordEvent.Finalize): androidx.camera.video.OutputResults {
            return pigeon_instance.outputResults
        }
    }
}

val Int.finalizeErrorArgs
    get() = when (this) {
        androidx.camera.video.VideoRecordEvent.Finalize.ERROR_NONE -> VideoRecordFinalizeEventError.NONE
        androidx.camera.video.VideoRecordEvent.Finalize.ERROR_UNKNOWN -> VideoRecordFinalizeEventError.UNKNOWN
        androidx.camera.video.VideoRecordEvent.Finalize.ERROR_FILE_SIZE_LIMIT_REACHED -> VideoRecordFinalizeEventError.FILE_SIZE_LIMIT_REACHED
        androidx.camera.video.VideoRecordEvent.Finalize.ERROR_INSUFFICIENT_STORAGE -> VideoRecordFinalizeEventError.INSUFFICIENT_STORAGE
        androidx.camera.video.VideoRecordEvent.Finalize.ERROR_SOURCE_INACTIVE -> VideoRecordFinalizeEventError.SOURCE_INACTIVE
        androidx.camera.video.VideoRecordEvent.Finalize.ERROR_INVALID_OUTPUT_OPTIONS -> VideoRecordFinalizeEventError.INVALID_OUPUT_OPTIONS
        androidx.camera.video.VideoRecordEvent.Finalize.ERROR_ENCODING_FAILED -> VideoRecordFinalizeEventError.ENCODING_FAILED
        androidx.camera.video.VideoRecordEvent.Finalize.ERROR_RECORDER_ERROR -> VideoRecordFinalizeEventError.RECORDER_ERROR
        androidx.camera.video.VideoRecordEvent.Finalize.ERROR_NO_VALID_DATA -> VideoRecordFinalizeEventError.NO_VALID_DATA
        androidx.camera.video.VideoRecordEvent.Finalize.ERROR_DURATION_LIMIT_REACHED -> VideoRecordFinalizeEventError.DURATION_LIMIT_REACHED
        androidx.camera.video.VideoRecordEvent.Finalize.ERROR_RECORDING_GARBAGE_COLLECTED -> VideoRecordFinalizeEventError.RECORDING_GARBAGE_COLLECTED
        else -> throw IllegalArgumentException()
    }