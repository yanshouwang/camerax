package dev.hebei.camerax_android.core

import android.graphics.Bitmap
import android.location.Location
import androidx.camera.core.ExperimentalZeroShutterLag
import androidx.camera.core.ImageCapture
import androidx.camera.core.ImageCaptureException
import androidx.camera.core.ImageProxy
import dev.hebei.camerax_android.CameraXImpl
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
    class MetadataImpl(impl: CameraXImpl) : PigeonApiMetadataApi(impl) {
        override fun pigeon_defaultConstructor(
            isReversedHorizontal: Boolean, isReversedVertical: Boolean, location: Location?
        ): ImageCapture.Metadata {
            return ImageCapture.Metadata().apply {
                this.isReversedHorizontal = isReversedHorizontal
                this.isReversedVertical = isReversedVertical
                this.location = location
            }
        }

        override fun isReversedHorizontal(pigeon_instance: ImageCapture.Metadata): Boolean {
            return pigeon_instance.isReversedHorizontal
        }

        override fun isReversedVertical(pigeon_instance: ImageCapture.Metadata): Boolean {
            return pigeon_instance.isReversedVertical
        }

        override fun location(pigeon_instance: ImageCapture.Metadata): Location? {
            return pigeon_instance.location
        }
    }

    class OutputFileOptionsImpl(impl: CameraXImpl) : PigeonApiOutputFileOptionsApi(impl) {
        override fun build(file: String, metadata: ImageCapture.Metadata?): ImageCapture.OutputFileOptions {
            val builder = ImageCapture.OutputFileOptions.Builder(file.fileImpl)
            if (metadata != null) {
                builder.setMetadata(metadata)
            }
            return builder.build()
        }
    }

    class OutputFileResultsImpl(impl: CameraXImpl) : PigeonApiOutputFileResultsApi(impl) {
        override fun savedUri(pigeon_instance: ImageCapture.OutputFileResults): String? {
            return pigeon_instance.savedUri?.api
        }
    }

    class OnImageCapturedCallbackImpl(impl: CameraXImpl) : PigeonApiOnImageCapturedCallbackApi(impl) {
        override fun pigeon_defaultConstructor(): ImageCapture.OnImageCapturedCallback {
            return object : ImageCapture.OnImageCapturedCallback() {
                override fun onCaptureStarted() {
                    super.onCaptureStarted()
                    onCaptureStarted(this) {}
                }

                override fun onCaptureProcessProgressed(progress: Int) {
                    super.onCaptureProcessProgressed(progress)
                    onCaptureProcessProgressed(this, progress.toLong()) {}
                }

                override fun onPostviewBitmapAvailable(bitmap: Bitmap) {
                    super.onPostviewBitmapAvailable(bitmap)
                    onPostviewBitmapAvailable(this, bitmap.api) {}
                }

                override fun onCaptureSuccess(image: ImageProxy) {
                    super.onCaptureSuccess(image)
                    onCaptureSuccess(this, image) {}
                }

                override fun onError(exception: ImageCaptureException) {
                    super.onError(exception)
                    onError(this, exception.api) {}
                }
            }
        }
    }

    class OnImageSavedCallbackImpl(impl: CameraXImpl) : PigeonApiOnImageSavedCallbackApi(impl) {
        override fun pigeon_defaultConstructor(): ImageCapture.OnImageSavedCallback {
            return object : ImageCapture.OnImageSavedCallback {
                override fun onCaptureStarted() {
                    super.onCaptureStarted()
                    onCaptureStarted(this) {}
                }

                override fun onCaptureProcessProgressed(progress: Int) {
                    super.onCaptureProcessProgressed(progress)
                    onCaptureProcessProgressed(this, progress.toLong()) {}
                }

                override fun onPostviewBitmapAvailable(bitmap: Bitmap) {
                    super.onPostviewBitmapAvailable(bitmap)
                    onPostviewBitmapAvailable(this, bitmap.api) {}
                }

                override fun onImageSaved(outputFileResults: ImageCapture.OutputFileResults) {
                    onImageSaved(this, outputFileResults) {}
                }

                override fun onError(exception: ImageCaptureException) {
                    onError(this, exception.api) {}
                }
            }
        }
    }
}

val CaptureModeApi.impl
    @ExperimentalZeroShutterLag get() = when (this) {
        CaptureModeApi.MAXIMIZE_QUALITY -> ImageCapture.CAPTURE_MODE_MAXIMIZE_QUALITY
        CaptureModeApi.MINIMIZE_LATENCY -> ImageCapture.CAPTURE_MODE_MINIMIZE_LATENCY
        CaptureModeApi.ZERO_SHUTTER_LAG -> ImageCapture.CAPTURE_MODE_ZERO_SHUTTER_LAG
    }

val Int.captureModeApi
    @ExperimentalZeroShutterLag get() = when (this) {
        ImageCapture.CAPTURE_MODE_MAXIMIZE_QUALITY -> CaptureModeApi.MINIMIZE_LATENCY
        ImageCapture.CAPTURE_MODE_MINIMIZE_LATENCY -> CaptureModeApi.MINIMIZE_LATENCY
        ImageCapture.CAPTURE_MODE_ZERO_SHUTTER_LAG -> CaptureModeApi.MINIMIZE_LATENCY
        else -> throw IllegalArgumentException()
    }

val FlashModeApi.impl
    get() = when (this) {
        FlashModeApi.AUTO -> ImageCapture.FLASH_MODE_AUTO
        FlashModeApi.ON -> ImageCapture.FLASH_MODE_ON
        FlashModeApi.OFF -> ImageCapture.FLASH_MODE_OFF
        FlashModeApi.SCREEN -> ImageCapture.FLASH_MODE_SCREEN
    }

val Int.flashModeApi
    get() = when (this) {
        ImageCapture.FLASH_MODE_AUTO -> FlashModeApi.AUTO
        ImageCapture.FLASH_MODE_ON -> FlashModeApi.ON
        ImageCapture.FLASH_MODE_OFF -> FlashModeApi.OFF
        ImageCapture.FLASH_MODE_SCREEN -> FlashModeApi.SCREEN
        else -> throw IllegalArgumentException()
    }