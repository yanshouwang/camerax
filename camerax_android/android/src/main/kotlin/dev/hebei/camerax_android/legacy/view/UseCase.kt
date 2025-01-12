package dev.hebei.camerax_android.legacy.view

import dev.hebei.camerax_android.legacy.UseCase

val UseCase.obj
    get() = when (this) {
        UseCase.IMAGE_CAPTURE -> androidx.camera.view.CameraController.IMAGE_CAPTURE
        UseCase.IMAGE_ANALYSIS -> androidx.camera.view.CameraController.IMAGE_ANALYSIS
        UseCase.VIDEO_CAPTURE -> androidx.camera.view.CameraController.VIDEO_CAPTURE
    }