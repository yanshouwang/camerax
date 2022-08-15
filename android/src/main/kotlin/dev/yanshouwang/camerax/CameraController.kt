package dev.yanshouwang.camerax

import androidx.camera.core.Camera
import androidx.camera.core.ImageAnalysis
import androidx.camera.core.ImageCapture
import androidx.camera.core.ImageProxy
import androidx.camera.core.Preview
import io.flutter.plugin.common.EventChannel
import io.flutter.view.TextureRegistry

class CameraController(
    val camera: Camera,
    val textureEntry: TextureRegistry.SurfaceTextureEntry,
    val preview: Preview,
    val imageAnalysis: ImageAnalysis,
    val imageCapture: ImageCapture,
    val imageProxies: MutableMap<String, ImageProxy> = mutableMapOf()
)