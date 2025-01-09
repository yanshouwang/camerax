package dev.hebei.camerax_android.core

class ImageInfo internal constructor(internal val obj: androidx.camera.core.ImageInfo) {
    val rotationDegrees get() = obj.rotationDegrees
    val sensorToBufferTransformMatrix get() = obj.sensorToBufferTransformMatrix
    val timestamp get() = obj.timestamp
}