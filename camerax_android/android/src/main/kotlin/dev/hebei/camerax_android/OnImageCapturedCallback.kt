package dev.hebei.camerax_android

import androidx.camera.core.ImageCaptureException
import androidx.camera.core.ImageProxy

interface OnImageCapturedCallback {
    fun onCaptureSuccess(image: ImageProxy)
    fun onError(exception: ImageCaptureException)
}