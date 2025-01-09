package dev.hebei.camerax_android.core

import android.content.ContentResolver
import android.content.ContentValues
import android.graphics.Bitmap
import android.net.Uri
import androidx.camera.core.ImageCaptureException
import java.io.File
import java.io.OutputStream

class ImageCapture {
    enum class CaptureMode {
        MAXIMIZE_QUALITY, MINIMIZE_LATENCY, ZERO_SHUTTER_LAG,
    }

    enum class FlashMode {
        AUTO, ON, OFF, SCREEN,
    }

    class Metadata {
        internal constructor(obj: androidx.camera.core.ImageCapture.Metadata) {
            this.obj = obj
        }

        constructor() {
            this.obj = androidx.camera.core.ImageCapture.Metadata()
        }

        internal val obj: androidx.camera.core.ImageCapture.Metadata

        var location
            get() = obj.location
            set(value) {
                obj.location = value
            }
        var isReversedHorizontal
            get() = obj.isReversedHorizontal
            set(value) {
                obj.isReversedHorizontal = value
            }
        var isReversedVertical
            get() = obj.isReversedVertical
            set(value) {
                obj.isReversedVertical = value
            }
    }

    class OutputFileOptions internal constructor(internal val obj: androidx.camera.core.ImageCapture.OutputFileOptions) {
        class Builder {
            internal constructor(obj: androidx.camera.core.ImageCapture.OutputFileOptions.Builder) {
                this.obj = obj
            }

            constructor(file: File) {
                this.obj = androidx.camera.core.ImageCapture.OutputFileOptions.Builder(file)
            }

            constructor(outputStream: OutputStream) {
                this.obj = androidx.camera.core.ImageCapture.OutputFileOptions.Builder(outputStream)
            }

            constructor(
                contentResolver: ContentResolver, saveCollection: Uri, contentValues: ContentValues
            ) {
                this.obj = androidx.camera.core.ImageCapture.OutputFileOptions.Builder(
                    contentResolver, saveCollection, contentValues
                )
            }

            private val obj: androidx.camera.core.ImageCapture.OutputFileOptions.Builder

            fun setMetadata(metadata: Metadata): Builder {
                val obj = this.obj.setMetadata(metadata.obj)
                return Builder(obj)
            }

            fun build(): OutputFileOptions {
                val obj = this.obj.build()
                return OutputFileOptions(obj)
            }
        }
    }

    class OutputFileResults internal constructor(internal val obj: androidx.camera.core.ImageCapture.OutputFileResults) {
        val savedUri get() = obj.savedUri
    }

    class OnImageCapturedCallback {
        internal constructor(obj: androidx.camera.core.ImageCapture.OnImageCapturedCallback) {
            this.obj = obj
        }

        constructor(stub: Stub) {
            this.obj = object : androidx.camera.core.ImageCapture.OnImageCapturedCallback() {
                override fun onCaptureStarted() {
                    super.onCaptureStarted()
                    stub.onCaptureStarted()
                }

                override fun onCaptureProcessProgressed(progress: Int) {
                    super.onCaptureProcessProgressed(progress)
                    stub.onCaptureProcessProgressed(progress)
                }

                override fun onPostviewBitmapAvailable(bitmap: Bitmap) {
                    super.onPostviewBitmapAvailable(bitmap)
                    stub.onPostviewBitmapAvailable(bitmap)
                }

                override fun onCaptureSuccess(image: androidx.camera.core.ImageProxy) {
                    super.onCaptureSuccess(image)
                    stub.onCaptureSuccess(ImageProxy(image))
                }

                override fun onError(exception: androidx.camera.core.ImageCaptureException) {
                    super.onError(exception)
                    stub.onError(exception)
                }
            }
        }

        internal val obj: androidx.camera.core.ImageCapture.OnImageCapturedCallback

        interface Stub {
            fun onCaptureStarted()
            fun onCaptureProcessProgressed(progress: Int)
            fun onPostviewBitmapAvailable(bitmap: Bitmap)
            fun onCaptureSuccess(image: ImageProxy)
            fun onError(exception: Exception)
        }
    }

    class OnImageSavedCallback {
        internal constructor(obj: androidx.camera.core.ImageCapture.OnImageSavedCallback) {
            this.obj = obj
        }

        constructor(stub: Stub) {
            this.obj = object : androidx.camera.core.ImageCapture.OnImageSavedCallback {
                override fun onCaptureStarted() {
                    super.onCaptureStarted()
                    stub.onCaptureStarted()
                }

                override fun onCaptureProcessProgressed(progress: Int) {
                    super.onCaptureProcessProgressed(progress)
                    stub.onCaptureProcessProgressed(progress)
                }

                override fun onPostviewBitmapAvailable(bitmap: Bitmap) {
                    super.onPostviewBitmapAvailable(bitmap)
                    stub.onPostviewBitmapAvailable(bitmap)
                }

                override fun onImageSaved(outputFileResults: androidx.camera.core.ImageCapture.OutputFileResults) {
                    stub.onImageSaved(OutputFileResults(outputFileResults))
                }

                override fun onError(exception: ImageCaptureException) {
                    stub.onError(exception)
                }
            }
        }

        internal val obj: androidx.camera.core.ImageCapture.OnImageSavedCallback

        interface Stub {
            fun onCaptureStarted()
            fun onCaptureProcessProgressed(progress: Int)
            fun onPostviewBitmapAvailable(bitmap: Bitmap)
            fun onImageSaved(outputFileResults: OutputFileResults)
            fun onError(exception: Exception)
        }
    }
}

val ImageCapture.CaptureMode.obj
    @androidx.camera.core.ExperimentalZeroShutterLag get() = when (this) {
        ImageCapture.CaptureMode.MAXIMIZE_QUALITY -> androidx.camera.core.ImageCapture.CAPTURE_MODE_MAXIMIZE_QUALITY
        ImageCapture.CaptureMode.MINIMIZE_LATENCY -> androidx.camera.core.ImageCapture.CAPTURE_MODE_MINIMIZE_LATENCY
        ImageCapture.CaptureMode.ZERO_SHUTTER_LAG -> androidx.camera.core.ImageCapture.CAPTURE_MODE_ZERO_SHUTTER_LAG
    }

val Int.imageCaptureModeArgs
    @androidx.camera.core.ExperimentalZeroShutterLag get() = when (this) {
        androidx.camera.core.ImageCapture.CAPTURE_MODE_MAXIMIZE_QUALITY -> ImageCapture.CaptureMode.MINIMIZE_LATENCY
        androidx.camera.core.ImageCapture.CAPTURE_MODE_MINIMIZE_LATENCY -> ImageCapture.CaptureMode.MINIMIZE_LATENCY
        androidx.camera.core.ImageCapture.CAPTURE_MODE_ZERO_SHUTTER_LAG -> ImageCapture.CaptureMode.MINIMIZE_LATENCY
        else -> throw IllegalArgumentException()
    }

val ImageCapture.FlashMode.obj
    get() = when (this) {
        ImageCapture.FlashMode.AUTO -> androidx.camera.core.ImageCapture.FLASH_MODE_AUTO
        ImageCapture.FlashMode.ON -> androidx.camera.core.ImageCapture.FLASH_MODE_ON
        ImageCapture.FlashMode.OFF -> androidx.camera.core.ImageCapture.FLASH_MODE_OFF
        ImageCapture.FlashMode.SCREEN -> androidx.camera.core.ImageCapture.FLASH_MODE_SCREEN
    }

val Int.flashModeArgs
    get() = when (this) {
        androidx.camera.core.ImageCapture.FLASH_MODE_AUTO -> ImageCapture.FlashMode.AUTO
        androidx.camera.core.ImageCapture.FLASH_MODE_ON -> ImageCapture.FlashMode.ON
        androidx.camera.core.ImageCapture.FLASH_MODE_OFF -> ImageCapture.FlashMode.OFF
        androidx.camera.core.ImageCapture.FLASH_MODE_SCREEN -> ImageCapture.FlashMode.SCREEN
        else -> throw IllegalArgumentException()
    }