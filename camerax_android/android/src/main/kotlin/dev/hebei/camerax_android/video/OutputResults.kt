package dev.hebei.camerax_android.video

class OutputResults internal constructor(internal val obj: androidx.camera.video.OutputResults) {
    val outputUri get() = obj.outputUri
}