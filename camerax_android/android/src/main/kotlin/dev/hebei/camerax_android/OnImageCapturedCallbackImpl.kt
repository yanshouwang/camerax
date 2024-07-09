package dev.hebei.camerax_android

import androidx.annotation.Keep
import androidx.camera.core.ImageCapture
import androidx.camera.core.ImageCaptureException
import androidx.camera.core.ImageProxy

@Keep
class OnImageCapturedCallbackImpl(private val callback: OnImageCapturedCallback) : ImageCapture.OnImageCapturedCallback() {
    override fun onCaptureSuccess(image: ImageProxy) {
        super.onCaptureSuccess(image)
        callback.onCaptureSuccess(image)
    }

    override fun onError(exception: ImageCaptureException) {
        super.onError(exception)
        callback.onError(exception)
    }
}