package dev.hebei.camerax_android

import android.annotation.SuppressLint
import androidx.camera.core.CameraSelector
import androidx.camera.view.PreviewView.ScaleType

fun CameraSelectorArgs.toCameraSelector(): CameraSelector {
    val lensFacing = lensFacingArgs.toLensFacing()
    return CameraSelector.Builder().requireLensFacing(lensFacing).build()
}

@SuppressLint("UnsafeOptInUsageError")
fun LensFacingArgs.toLensFacing(): Int {
    return when (this) {
        LensFacingArgs.FRONT -> CameraSelector.LENS_FACING_FRONT
        LensFacingArgs.BACK -> CameraSelector.LENS_FACING_BACK
        LensFacingArgs.EXTERNAL -> CameraSelector.LENS_FACING_EXTERNAL
    }
}

fun ScaleTypeArgs.toScaleType(): ScaleType {
    return when (this) {
        ScaleTypeArgs.FILL_CENTER -> ScaleType.FILL_CENTER
        ScaleTypeArgs.FILL_END -> ScaleType.FILL_END
        ScaleTypeArgs.FILL_START -> ScaleType.FILL_START
        ScaleTypeArgs.FIT_CENTER -> ScaleType.FIT_CENTER
        ScaleTypeArgs.FIT_END -> ScaleType.FIT_END
        ScaleTypeArgs.FIT_START -> ScaleType.FIT_START
    }
}