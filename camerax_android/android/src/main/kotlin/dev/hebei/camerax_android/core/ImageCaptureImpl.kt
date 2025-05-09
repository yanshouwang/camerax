package dev.hebei.camerax_android.core

import dev.hebei.camerax_android.CameraXRegistrar
import dev.hebei.camerax_android.CaptureModeApi
import dev.hebei.camerax_android.FlashModeApi
import dev.hebei.camerax_android.PigeonApiMetadataApi
import dev.hebei.camerax_android.PigeonApiOnImageCapturedCallbackApi
import dev.hebei.camerax_android.PigeonApiOnImageSavedCallbackApi
import dev.hebei.camerax_android.PigeonApiOutputFileOptionsApi
import dev.hebei.camerax_android.PigeonApiOutputFileResultsApi
import dev.hebei.camerax_android.common.api
import dev.hebei.camerax_android.common.fileImpl

class ImageCaptureImpl {
    class MetadataImpl(registrar: CameraXRegistrar) : PigeonApiMetadataApi(registrar) {
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

    class OutputFileOptionsImpl(registrar: CameraXRegistrar) : PigeonApiOutputFileOptionsApi(registrar) {
        override fun build(
            file: String, metadata: androidx.camera.core.ImageCapture.Metadata?
        ): androidx.camera.core.ImageCapture.OutputFileOptions {
            val builder = androidx.camera.core.ImageCapture.OutputFileOptions.Builder(file.fileImpl)
            if (metadata != null) {
                builder.setMetadata(metadata)
            }
            return builder.build()
        }
    }

    class OutputFileResultsImpl(registrar: CameraXRegistrar) : PigeonApiOutputFileResultsApi(registrar) {
        override fun savedUri(pigeon_instance: androidx.camera.core.ImageCapture.OutputFileResults): String? {
            return pigeon_instance.savedUri?.api
        }
    }

    class OnImageCapturedCallbackImpl(registrar: CameraXRegistrar) : PigeonApiOnImageCapturedCallbackApi(registrar) {
        override fun pigeon_defaultConstructor(): androidx.camera.core.ImageCapture.OnImageCapturedCallback {
            return Impl(this)
        }

        class Impl(private val api: PigeonApiOnImageCapturedCallbackApi) :
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
                api.onPostviewBitmapAvailable(this, bitmap.api) {}
            }

            override fun onCaptureSuccess(image: androidx.camera.core.ImageProxy) {
                super.onCaptureSuccess(image)
                api.onCaptureSuccess(this, image) {}
            }

            override fun onError(exception: androidx.camera.core.ImageCaptureException) {
                super.onError(exception)
                api.onError(this, exception.api) {}
            }
        }
    }

    class OnImageSavedCallbackImpl(registrar: CameraXRegistrar) : PigeonApiOnImageSavedCallbackApi(registrar) {
        override fun pigeon_defaultConstructor(): androidx.camera.core.ImageCapture.OnImageSavedCallback {
            return Impl(this)
        }

        class Impl(private val api: PigeonApiOnImageSavedCallbackApi) :
            androidx.camera.core.ImageCapture.OnImageSavedCallback {
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
                api.onPostviewBitmapAvailable(this, bitmap.api) {}
            }

            override fun onImageSaved(outputFileResults: androidx.camera.core.ImageCapture.OutputFileResults) {
                api.onImageSaved(this, outputFileResults) {}
            }

            override fun onError(exception: androidx.camera.core.ImageCaptureException) {
                api.onError(this, exception.api) {}
            }
        }
    }
}

val CaptureModeApi.impl
    get() = when (this) {
        CaptureModeApi.MAXIMIZE_QUALITY -> androidx.camera.core.ImageCapture.CAPTURE_MODE_MAXIMIZE_QUALITY
        CaptureModeApi.MINIMIZE_LATENCY -> androidx.camera.core.ImageCapture.CAPTURE_MODE_MINIMIZE_LATENCY
        CaptureModeApi.ZERO_SHUTTER_LAG -> androidx.camera.core.ImageCapture.CAPTURE_MODE_ZERO_SHUTTER_LAG
    }

val Int.captureModeApi
    get() = when (this) {
        androidx.camera.core.ImageCapture.CAPTURE_MODE_MAXIMIZE_QUALITY -> CaptureModeApi.MINIMIZE_LATENCY
        androidx.camera.core.ImageCapture.CAPTURE_MODE_MINIMIZE_LATENCY -> CaptureModeApi.MINIMIZE_LATENCY
        androidx.camera.core.ImageCapture.CAPTURE_MODE_ZERO_SHUTTER_LAG -> CaptureModeApi.MINIMIZE_LATENCY
        else -> throw IllegalArgumentException()
    }

val FlashModeApi.impl
    get() = when (this) {
        FlashModeApi.AUTO -> androidx.camera.core.ImageCapture.FLASH_MODE_AUTO
        FlashModeApi.ON -> androidx.camera.core.ImageCapture.FLASH_MODE_ON
        FlashModeApi.OFF -> androidx.camera.core.ImageCapture.FLASH_MODE_OFF
        FlashModeApi.SCREEN -> androidx.camera.core.ImageCapture.FLASH_MODE_SCREEN
    }

val Int.flashModeApi
    get() = when (this) {
        androidx.camera.core.ImageCapture.FLASH_MODE_AUTO -> FlashModeApi.AUTO
        androidx.camera.core.ImageCapture.FLASH_MODE_ON -> FlashModeApi.ON
        androidx.camera.core.ImageCapture.FLASH_MODE_OFF -> FlashModeApi.OFF
        androidx.camera.core.ImageCapture.FLASH_MODE_SCREEN -> FlashModeApi.SCREEN
        else -> throw IllegalArgumentException()
    }