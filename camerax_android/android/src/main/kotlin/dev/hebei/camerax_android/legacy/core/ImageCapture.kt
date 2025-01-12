package dev.hebei.camerax_android.legacy.core

import dev.hebei.camerax_android.legacy.FlashMode
import dev.hebei.camerax_android.legacy.CaptureMode

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