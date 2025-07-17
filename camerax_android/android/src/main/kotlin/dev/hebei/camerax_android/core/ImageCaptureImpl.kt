package dev.hebei.camerax_android.core

import android.graphics.Bitmap
import androidx.camera.core.ExperimentalZeroShutterLag
import androidx.camera.core.ImageCapture
import androidx.camera.core.ImageCaptureException
import androidx.camera.core.ImageProxy
import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.CaptureModeApi
import dev.hebei.camerax_android.FlashModeApi
import dev.hebei.camerax_android.PigeonApiOnImageCapturedCallbackApi
import dev.hebei.camerax_android.common.api

class ImageCaptureImpl {
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