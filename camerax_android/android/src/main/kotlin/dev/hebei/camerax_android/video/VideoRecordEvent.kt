package dev.hebei.camerax_android.video

abstract class VideoRecordEvent internal constructor(internal open val obj: androidx.camera.video.VideoRecordEvent) {
    val outputOptions: OutputOptions
        get() {
            val obj = this.obj.outputOptions
            return when (obj) {
                is androidx.camera.video.FileOutputOptions -> FileOutputOptions(obj)
                is androidx.camera.video.MediaStoreOutputOptions -> MediaStoreOutputOptions(obj)
                is androidx.camera.video.FileDescriptorOutputOptions -> FileDescriptorOutputOptions(
                    obj
                )

                else -> throw TypeCastException()
            }
        }

    val recordingStats: RecordingStats
        get() {
            val obj = this.obj.recordingStats
            return RecordingStats(obj)
        }

    class Status internal constructor(override val obj: androidx.camera.video.VideoRecordEvent.Status) :
        VideoRecordEvent(obj) {}

    class Start internal constructor(override val obj: androidx.camera.video.VideoRecordEvent.Start) :
        VideoRecordEvent(obj) {}

    class Pause internal constructor(override val obj: androidx.camera.video.VideoRecordEvent.Pause) :
        VideoRecordEvent(obj) {}

    class Resume internal constructor(override val obj: androidx.camera.video.VideoRecordEvent.Resume) :
        VideoRecordEvent(obj) {}

    class Finalize internal constructor(override val obj: androidx.camera.video.VideoRecordEvent.Finalize) :
        VideoRecordEvent(obj) {
        val cause get() = obj.cause
        val error get() = obj.error.finalizeErrorArgs
        val outputResults get() = OutputResults(obj.outputResults)

        enum class Error {
            NONE, UNKNOWN, FILE_SIZE_LIMIT_REACHED, INSUFFICIENT_STORAGE, SOURCE_INACTIVE, INVALID_OUTPUT_OPTIONS, ENCODING_FAILED, RECORDER_ERROR, NO_VALID_DATA, DURATION_LIMIT_REACHED, RECORDING_GARBAGE_COLLECTED,
        }
    }
}

val Int.finalizeErrorArgs
    get() = when (this) {
        androidx.camera.video.VideoRecordEvent.Finalize.ERROR_NONE -> VideoRecordEvent.Finalize.Error.NONE
        androidx.camera.video.VideoRecordEvent.Finalize.ERROR_UNKNOWN -> VideoRecordEvent.Finalize.Error.UNKNOWN
        androidx.camera.video.VideoRecordEvent.Finalize.ERROR_FILE_SIZE_LIMIT_REACHED -> VideoRecordEvent.Finalize.Error.FILE_SIZE_LIMIT_REACHED
        androidx.camera.video.VideoRecordEvent.Finalize.ERROR_INSUFFICIENT_STORAGE -> VideoRecordEvent.Finalize.Error.INSUFFICIENT_STORAGE
        androidx.camera.video.VideoRecordEvent.Finalize.ERROR_SOURCE_INACTIVE -> VideoRecordEvent.Finalize.Error.SOURCE_INACTIVE
        androidx.camera.video.VideoRecordEvent.Finalize.ERROR_INVALID_OUTPUT_OPTIONS -> VideoRecordEvent.Finalize.Error.INVALID_OUTPUT_OPTIONS
        androidx.camera.video.VideoRecordEvent.Finalize.ERROR_ENCODING_FAILED -> VideoRecordEvent.Finalize.Error.ENCODING_FAILED
        androidx.camera.video.VideoRecordEvent.Finalize.ERROR_RECORDER_ERROR -> VideoRecordEvent.Finalize.Error.RECORDER_ERROR
        androidx.camera.video.VideoRecordEvent.Finalize.ERROR_NO_VALID_DATA -> VideoRecordEvent.Finalize.Error.NO_VALID_DATA
        androidx.camera.video.VideoRecordEvent.Finalize.ERROR_DURATION_LIMIT_REACHED -> VideoRecordEvent.Finalize.Error.DURATION_LIMIT_REACHED
        androidx.camera.video.VideoRecordEvent.Finalize.ERROR_RECORDING_GARBAGE_COLLECTED -> VideoRecordEvent.Finalize.Error.RECORDING_GARBAGE_COLLECTED
        else -> throw IllegalArgumentException()
    }