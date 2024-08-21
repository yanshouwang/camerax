package dev.hebei.camerax_android

import android.content.ContentResolver
import android.content.ContentValues
import android.graphics.Bitmap
import android.net.Uri
import androidx.annotation.Keep
import androidx.camera.core.ImageCapture
import androidx.camera.core.ImageCaptureException
import androidx.camera.core.ImageProxy
import java.io.File
import java.io.OutputStream

@Keep
class MyImageCapture {
    companion object {
        const val CAPTURE_MODE_MINIMIZE_LATENCY = ImageCapture.CAPTURE_MODE_MINIMIZE_LATENCY
        const val CAPTURE_MODE_MAXIMIZE_QUALITY = ImageCapture.CAPTURE_MODE_MAXIMIZE_QUALITY
        const val FLASH_MODE_AUTO = ImageCapture.FLASH_MODE_AUTO
        const val FLASH_MODE_OFF = ImageCapture.FLASH_MODE_OFF
        const val FLASH_MODE_ON = ImageCapture.FLASH_MODE_ON
        const val FLASH_MODE_SCREEN = ImageCapture.FLASH_MODE_SCREEN
    }

    interface MyOnImageCapturedCallback {
        fun onCaptureStarted()
        fun onCaptureProcessProgressed(progress: Int)
        fun onCaptureSuccess(image: ImageProxy)
        fun onError(exception: ImageCaptureException)
        fun onPostviewBitmapAvailable(bitmap: Bitmap)
    }

    interface MyOnImageSavedCallback {
        fun onCaptureStarted()
        fun onCaptureProcessProgressed(progress: Int)
        fun onImageSaved(outputFileResults: MyOutputFileResults)
        fun onError(exception: ImageCaptureException)
        fun onPostviewBitmapAvailable(bitmap: Bitmap)
    }

    class MyOnImageCapturedCallbackImpl(private val callback: MyOnImageCapturedCallback) : ImageCapture.OnImageCapturedCallback() {
        override fun onCaptureStarted() {
            super.onCaptureStarted()
            callback.onCaptureStarted()
        }

        override fun onCaptureProcessProgressed(progress: Int) {
            super.onCaptureProcessProgressed(progress)
            callback.onCaptureProcessProgressed(progress)
        }

        override fun onCaptureSuccess(image: ImageProxy) {
            super.onCaptureSuccess(image)
            callback.onCaptureSuccess(image)
        }

        override fun onError(exception: ImageCaptureException) {
            super.onError(exception)
            callback.onError(exception)
        }

        override fun onPostviewBitmapAvailable(bitmap: Bitmap) {
            super.onPostviewBitmapAvailable(bitmap)
            callback.onPostviewBitmapAvailable(bitmap)
        }
    }

    class MyOutputFileOptions {
        class MyBuilder {
            constructor(file: File) {
                builder = ImageCapture.OutputFileOptions.Builder(file)
            }

            constructor(contentResolver: ContentResolver, savedCollection: Uri, contentValues: ContentValues) {
                builder = ImageCapture.OutputFileOptions.Builder(contentResolver, savedCollection, contentValues)
            }

            constructor(outputStream: OutputStream) {
                builder = ImageCapture.OutputFileOptions.Builder(outputStream)
            }

            private val builder: ImageCapture.OutputFileOptions.Builder

            fun setMetadata(metadata: ImageCapture.Metadata): ImageCapture.OutputFileOptions.Builder {
                return builder.setMetadata(metadata)
            }

            fun build(): ImageCapture.OutputFileOptions {
                return builder.build()
            }
        }
    }

    class MyOutputFileResults(private val outputFileResults: ImageCapture.OutputFileResults) {
        val savedUri get() = outputFileResults.savedUri
    }

    class MyOnImageSavedCallbackImpl(private val callback: MyOnImageSavedCallback) : ImageCapture.OnImageSavedCallback {
        override fun onCaptureStarted() {
            super.onCaptureStarted()
            callback.onCaptureStarted()
        }

        override fun onCaptureProcessProgressed(progress: Int) {
            super.onCaptureProcessProgressed(progress)
            callback.onCaptureProcessProgressed(progress)
        }

        override fun onImageSaved(outputFileResults: ImageCapture.OutputFileResults) {
            val myOutputFileResults = MyOutputFileResults(outputFileResults)
            callback.onImageSaved(myOutputFileResults)
        }

        override fun onError(exception: ImageCaptureException) {
            callback.onError(exception)
        }

        override fun onPostviewBitmapAvailable(bitmap: Bitmap) {
            super.onPostviewBitmapAvailable(bitmap)
            callback.onPostviewBitmapAvailable(bitmap)
        }
    }
}