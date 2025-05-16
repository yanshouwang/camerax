package dev.hebei.camerax_android.ml.face

import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.FaceClassificationModeApi
import dev.hebei.camerax_android.FaceContourModeApi
import dev.hebei.camerax_android.FaceLandmarkModeApi
import dev.hebei.camerax_android.FacePerformanceModeApi
import dev.hebei.camerax_android.PigeonApiFaceDetectorOptionsApi

class FaceDetectorOptionsImpl(impl: CameraXImpl) : PigeonApiFaceDetectorOptionsApi(impl) {
    override fun build(
        enableTracking: Boolean?,
        classificationMode: FaceClassificationModeApi?,
        contourMode: FaceContourModeApi?,
        landmarkMode: FaceLandmarkModeApi?,
        minFaceSize: Double?,
        performanceMode: FacePerformanceModeApi?
    ): com.google.mlkit.vision.face.FaceDetectorOptions {
        val builder = com.google.mlkit.vision.face.FaceDetectorOptions.Builder()
        if (enableTracking == true) {
            builder.enableTracking()
        }
        if (classificationMode != null) {
            builder.setClassificationMode(classificationMode.impl)
        }
        if (contourMode != null) {
            builder.setContourMode(contourMode.impl)
        }
        if (landmarkMode != null) {
            builder.setLandmarkMode(landmarkMode.impl)
        }
        if (minFaceSize != null) {
            builder.setMinFaceSize(minFaceSize.toFloat())
        }
        if (performanceMode != null) {
            builder.setPerformanceMode(performanceMode.impl)
        }
        return builder.build()
    }
}

val FaceClassificationModeApi.impl
    get() = when (this) {
        FaceClassificationModeApi.NONE -> com.google.mlkit.vision.face.FaceDetectorOptions.CLASSIFICATION_MODE_NONE
        FaceClassificationModeApi.ALL -> com.google.mlkit.vision.face.FaceDetectorOptions.CLASSIFICATION_MODE_ALL
    }

val FaceContourModeApi.impl
    get() = when (this) {
        FaceContourModeApi.NONE -> com.google.mlkit.vision.face.FaceDetectorOptions.CONTOUR_MODE_NONE
        FaceContourModeApi.ALL -> com.google.mlkit.vision.face.FaceDetectorOptions.CONTOUR_MODE_ALL
    }

val FaceLandmarkModeApi.impl
    get() = when (this) {
        FaceLandmarkModeApi.NONE -> com.google.mlkit.vision.face.FaceDetectorOptions.LANDMARK_MODE_NONE
        FaceLandmarkModeApi.ALL -> com.google.mlkit.vision.face.FaceDetectorOptions.LANDMARK_MODE_ALL
    }

val FacePerformanceModeApi.impl
    get() = when (this) {
        FacePerformanceModeApi.FAST -> com.google.mlkit.vision.face.FaceDetectorOptions.PERFORMANCE_MODE_FAST
        FacePerformanceModeApi.ACCURATE -> com.google.mlkit.vision.face.FaceDetectorOptions.PERFORMANCE_MODE_ACCURATE
    }