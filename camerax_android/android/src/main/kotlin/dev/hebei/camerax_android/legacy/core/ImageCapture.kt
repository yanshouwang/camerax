package dev.hebei.camerax_android.legacy.core

import dev.hebei.camerax_android.legacy.*
import dev.hebei.camerax_android.legacy.common.args
import dev.hebei.camerax_android.legacy.common.fileObj

class ImageCapture {
    class Metadata(registrar: CameraXRegistrar) : PigeonApiMetadata(registrar) {
        override fun pigeon_defaultConstructor(
            isReversedHorizontal: Boolean, isReversedVertical: Boolean, location: android.location.Location?
        ): androidx.camera.core.ImageCapture.Metadata {
            return androidx.camera.core.ImageCapture.Metadata().apply {
                this.isReversedHorizontal = isReversedHorizontal
                this.isReversedVertical = isReversedVertical
                this.location = location
            }
        }

        override fun isReversedHorizontal(pigeon_instance: androidx.camera.core.ImageCapture.Metadata): Boolean {
            return pigeon_instance.isReversedHorizontal
        }

        override fun isReversedVertical(pigeon_instance: androidx.camera.core.ImageCapture.Metadata): Boolean {
            return pigeon_instance.isReversedVertical
        }

        override fun location(pigeon_instance: androidx.camera.core.ImageCapture.Metadata): android.location.Location? {
            return pigeon_instance.location
        }
    }

    class OutputFileOptions(registrar: CameraXRegistrar) : PigeonApiOutputFileOptions(registrar) {
        override fun build(
            file: String, metadata: androidx.camera.core.ImageCapture.Metadata?
        ): androidx.camera.core.ImageCapture.OutputFileOptions {
            val builder = androidx.camera.core.ImageCapture.OutputFileOptions.Builder(file.fileObj)
            if (metadata != null) {
                builder.setMetadata(metadata)
            }
            return builder.build()
        }
    }

    class OutputFileResults(registrar: CameraXRegistrar) : PigeonApiOutputFileResults(registrar) {
        override fun savedUri(pigeon_instance: androidx.camera.core.ImageCapture.OutputFileResults): String? {
            return pigeon_instance.savedUri?.args
        }
    }

    class OnImageCapturedCallback(registrar: CameraXRegistrar) : PigeonApiOnImageCapturedCallback(registrar) {
        override fun pigeon_defaultConstructor(): androidx.camera.core.ImageCapture.OnImageCapturedCallback {
            return Impl(this)
        }

        class Impl(private val api: OnImageCapturedCallback) :
            androidx.camera.core.ImageCapture.OnImageCapturedCallback() {
            override fun onCaptureStarted() {
                super.onCaptureStarted()
                api.onCaptureStarted(this) {}
            }

            override fun onCaptureProcessProgressed(progress: Int) {
                super.onCaptureProcessProgressed(progress)
                api.onCaptureProcessProgressed(this, progress.toLong()) {}
            }

            override fun onPostviewBitmapAvailable(bitmap: android.graphics.Bitmap) {
                super.onPostviewBitmapAvailable(bitmap)
                api.onPostviewBitmapAvailable(this, bitmap.args) {}
            }

            override fun onCaptureSuccess(image: androidx.camera.core.ImageProxy) {
                super.onCaptureSuccess(image)
                api.onCaptureSuccess(this, image) {}
            }

            override fun onError(exception: androidx.camera.core.ImageCaptureException) {
                super.onError(exception)
                api.onError(this, exception.args) {}
            }
        }
    }

    class OnImageSavedCallback(registrar: CameraXRegistrar) : PigeonApiOnImageSavedCallback(registrar) {
        override fun pigeon_defaultConstructor(): androidx.camera.core.ImageCapture.OnImageSavedCallback {
            return Impl(this)
        }

        class Impl(private val api: OnImageSavedCallback) : androidx.camera.core.ImageCapture.OnImageSavedCallback {
            override fun onCaptureStarted() {
                super.onCaptureStarted()
                api.onCaptureStarted(this) {}
            }

            override fun onCaptureProcessProgressed(progress: Int) {
                super.onCaptureProcessProgressed(progress)
                api.onCaptureProcessProgressed(this, progress.toLong()) {}
            }

            override fun onPostviewBitmapAvailable(bitmap: android.graphics.Bitmap) {
                super.onPostviewBitmapAvailable(bitmap)
                api.onPostviewBitmapAvailable(this, bitmap.args) {}
            }

            override fun onImageSaved(outputFileResults: androidx.camera.core.ImageCapture.OutputFileResults) {
                api.onImageSaved(this, outputFileResults) {}
            }

            override fun onError(exception: androidx.camera.core.ImageCaptureException) {
                api.onError(this, exception.args) {}
            }
        }
    }
}

val CaptureMode.obj
    get() = when (this) {
        CaptureMode.MAXIMIZE_QUALITY -> androidx.camera.core.ImageCapture.CAPTURE_MODE_MAXIMIZE_QUALITY
        CaptureMode.MINIMIZE_LATENCY -> androidx.camera.core.ImageCapture.CAPTURE_MODE_MINIMIZE_LATENCY
        CaptureMode.ZERO_SHUTTER_LAG -> androidx.camera.core.ImageCapture.CAPTURE_MODE_ZERO_SHUTTER_LAG
    }

val Int.captureModeArgs
    get() = when (this) {
        androidx.camera.core.ImageCapture.CAPTURE_MODE_MAXIMIZE_QUALITY -> CaptureMode.MINIMIZE_LATENCY
        androidx.camera.core.ImageCapture.CAPTURE_MODE_MINIMIZE_LATENCY -> CaptureMode.MINIMIZE_LATENCY
        androidx.camera.core.ImageCapture.CAPTURE_MODE_ZERO_SHUTTER_LAG -> CaptureMode.MINIMIZE_LATENCY
        else -> throw IllegalArgumentException()
    }

val FlashMode.obj
    get() = when (this) {
        FlashMode.AUTO -> androidx.camera.core.ImageCapture.FLASH_MODE_AUTO
        FlashMode.ON -> androidx.camera.core.ImageCapture.FLASH_MODE_ON
        FlashMode.OFF -> androidx.camera.core.ImageCapture.FLASH_MODE_OFF
        FlashMode.SCREEN -> androidx.camera.core.ImageCapture.FLASH_MODE_SCREEN
    }

val Int.flashModeArgs
    get() = when (this) {
        androidx.camera.core.ImageCapture.FLASH_MODE_AUTO -> FlashMode.AUTO
        androidx.camera.core.ImageCapture.FLASH_MODE_ON -> FlashMode.ON
        androidx.camera.core.ImageCapture.FLASH_MODE_OFF -> FlashMode.OFF
        androidx.camera.core.ImageCapture.FLASH_MODE_SCREEN -> FlashMode.SCREEN
        else -> throw IllegalArgumentException()
    }