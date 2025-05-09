package dev.hebei.camerax_android.view

import dev.hebei.camerax_android.UseCaseApi

val UseCaseApi.impl
    get() = when (this) {
        UseCaseApi.IMAGE_CAPTURE -> androidx.camera.view.CameraController.IMAGE_CAPTURE
        UseCaseApi.IMAGE_ANALYSIS -> androidx.camera.view.CameraController.IMAGE_ANALYSIS
        UseCaseApi.VIDEO_CAPTURE -> androidx.camera.view.CameraController.VIDEO_CAPTURE
    }