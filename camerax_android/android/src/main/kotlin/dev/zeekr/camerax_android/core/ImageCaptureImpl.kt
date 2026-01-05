package dev.zeekr.camerax_android.core

import android.graphics.Bitmap
import androidx.annotation.OptIn
import androidx.camera.core.ExperimentalZeroShutterLag
import androidx.camera.core.ImageCapture
import androidx.camera.core.ImageCaptureException
import androidx.camera.core.ImageProxy
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.ImageCaptureCaptureModeApi
import dev.zeekr.camerax_android.ImageCaptureFlashModeApi
import dev.zeekr.camerax_android.PigeonApiImageCaptureOnImageCapturedCallbackProxyApi
import dev.zeekr.camerax_android.PigeonApiImageCaptureUtilProxyApi
import dev.zeekr.camerax_android.common.api

class ImageCaptureImpl {
    class OnImageCapturedCallbackImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
        PigeonApiImageCaptureOnImageCapturedCallbackProxyApi(registrar) {
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
                    onPostviewBitmapAvailable(this, bitmap) {}
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

    class UtilImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiImageCaptureUtilProxyApi(registrar) {
        override fun fromCaptureMode(value: Long): ImageCaptureCaptureModeApi {
            return Util.fromCaptureMode(value.toInt())
        }

        override fun fromFlashMode(value: Long): ImageCaptureFlashModeApi {
            return Util.fromFlashMode(value.toInt())
        }

        override fun toCaptureMode(api: ImageCaptureCaptureModeApi): Long {
            return Util.toCaptureMode(api).toLong()
        }

        override fun toFlashMode(api: ImageCaptureFlashModeApi): Long {
            return Util.toFlashMode(api).toLong()
        }
    }

    @OptIn(ExperimentalZeroShutterLag::class)
    object Util {
        fun fromCaptureMode(value: Int): ImageCaptureCaptureModeApi {
            return when (value) {
                ImageCapture.CAPTURE_MODE_MAXIMIZE_QUALITY -> ImageCaptureCaptureModeApi.MINIMIZE_LATENCY
                ImageCapture.CAPTURE_MODE_MINIMIZE_LATENCY -> ImageCaptureCaptureModeApi.MINIMIZE_LATENCY
                ImageCapture.CAPTURE_MODE_ZERO_SHUTTER_LAG -> ImageCaptureCaptureModeApi.MINIMIZE_LATENCY
                else -> throw IllegalArgumentException()
            }
        }

        fun fromFlashMode(value: Int): ImageCaptureFlashModeApi {
            return when (value) {
                ImageCapture.FLASH_MODE_AUTO -> ImageCaptureFlashModeApi.AUTO
                ImageCapture.FLASH_MODE_ON -> ImageCaptureFlashModeApi.ON
                ImageCapture.FLASH_MODE_OFF -> ImageCaptureFlashModeApi.OFF
                ImageCapture.FLASH_MODE_SCREEN -> ImageCaptureFlashModeApi.SCREEN
                else -> throw IllegalArgumentException()
            }
        }

        fun toCaptureMode(api: ImageCaptureCaptureModeApi): Int {
            return when (api) {
                ImageCaptureCaptureModeApi.MAXIMIZE_QUALITY -> ImageCapture.CAPTURE_MODE_MAXIMIZE_QUALITY
                ImageCaptureCaptureModeApi.MINIMIZE_LATENCY -> ImageCapture.CAPTURE_MODE_MINIMIZE_LATENCY
                ImageCaptureCaptureModeApi.ZERO_SHUTTER_LAG -> ImageCapture.CAPTURE_MODE_ZERO_SHUTTER_LAG
            }
        }

        fun toFlashMode(api: ImageCaptureFlashModeApi): Int {
            return when (api) {
                ImageCaptureFlashModeApi.AUTO -> ImageCapture.FLASH_MODE_AUTO
                ImageCaptureFlashModeApi.ON -> ImageCapture.FLASH_MODE_ON
                ImageCaptureFlashModeApi.OFF -> ImageCapture.FLASH_MODE_OFF
                ImageCaptureFlashModeApi.SCREEN -> ImageCapture.FLASH_MODE_SCREEN
            }
        }
    }
}
