package dev.hebei.camerax_android

import android.annotation.SuppressLint
import androidx.camera.core.CameraSelector
import androidx.camera.core.ZoomState
import androidx.camera.view.PreviewView.ScaleType

fun CameraSelectorArgs.toObject(): CameraSelector {
    val lensFacing = lensFacingArgs.toObject()
    return CameraSelector.Builder().requireLensFacing(lensFacing).build()
}

@SuppressLint("UnsafeOptInUsageError")
fun LensFacingArgs.toObject(): Int {
    return when (this) {
        LensFacingArgs.FRONT -> CameraSelector.LENS_FACING_FRONT
        LensFacingArgs.BACK -> CameraSelector.LENS_FACING_BACK
        LensFacingArgs.EXTERNAL -> CameraSelector.LENS_FACING_EXTERNAL
    }
}

fun ZoomState.toArgs(): ZoomStateArgs {
    val minZoomRatioArgs = minZoomRatio.toDouble()
    val maxZoomRatioArgs = maxZoomRatio.toDouble()
    val linearZoomArgs = linearZoom.toDouble()
    val zoomRatioArgs = zoomRatio.toDouble()
    return ZoomStateArgs(minZoomRatioArgs, maxZoomRatioArgs, linearZoomArgs, zoomRatioArgs)
}

fun ScaleTypeArgs.toObject(): ScaleType {
    return when (this) {
        ScaleTypeArgs.FILL_CENTER -> ScaleType.FILL_CENTER
        ScaleTypeArgs.FILL_END -> ScaleType.FILL_END
        ScaleTypeArgs.FILL_START -> ScaleType.FILL_START
        ScaleTypeArgs.FIT_CENTER -> ScaleType.FIT_CENTER
        ScaleTypeArgs.FIT_END -> ScaleType.FIT_END
        ScaleTypeArgs.FIT_START -> ScaleType.FIT_START
    }
}