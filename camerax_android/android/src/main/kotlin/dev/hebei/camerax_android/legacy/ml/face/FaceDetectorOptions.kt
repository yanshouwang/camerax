package dev.hebei.camerax_android.legacy.ml.face

import dev.hebei.camerax_android.legacy.*

class FaceDetectorOptions(registrar: CameraXRegistrar) : PigeonApiFaceDetectorOptions(registrar) {
    override fun build(
        enableTracking: Boolean?,
        classificationMode: FaceClassificationMode?,
        contourMode: FaceContourMode?,
        landmarkMode: FaceLandmarkMode?,
        minFaceSize: Double?,
        performanceMode: FacePerformanceMode?
    ): com.google.mlkit.vision.face.FaceDetectorOptions {
        val builder = com.google.mlkit.vision.face.FaceDetectorOptions.Builder()
        if (enableTracking == true) {
            builder.enableTracking()
        }
        if (classificationMode != null) {
            builder.setClassificationMode(classificationMode.obj)
        }
        if (contourMode != null) {
            builder.setContourMode(contourMode.obj)
        }
        if (landmarkMode != null) {
            builder.setLandmarkMode(landmarkMode.obj)
        }
        if (minFaceSize != null) {
            builder.setMinFaceSize(minFaceSize.toFloat())
        }
        if (performanceMode != null) {
            builder.setPerformanceMode(performanceMode.obj)
        }
        return builder.build()
    }
}

val FaceClassificationMode.obj
    get() = when (this) {
        FaceClassificationMode.NONE -> com.google.mlkit.vision.face.FaceDetectorOptions.CLASSIFICATION_MODE_NONE
        FaceClassificationMode.ALL -> com.google.mlkit.vision.face.FaceDetectorOptions.CLASSIFICATION_MODE_ALL
    }

val FaceContourMode.obj
    get() = when (this) {
        FaceContourMode.NONE -> com.google.mlkit.vision.face.FaceDetectorOptions.CONTOUR_MODE_NONE
        FaceContourMode.ALL -> com.google.mlkit.vision.face.FaceDetectorOptions.CONTOUR_MODE_ALL
    }

val FaceLandmarkMode.obj
    get() = when (this) {
        FaceLandmarkMode.NONE -> com.google.mlkit.vision.face.FaceDetectorOptions.LANDMARK_MODE_NONE
        FaceLandmarkMode.ALL -> com.google.mlkit.vision.face.FaceDetectorOptions.LANDMARK_MODE_ALL
    }

val FacePerformanceMode.obj
    get() = when (this) {
        FacePerformanceMode.FAST -> com.google.mlkit.vision.face.FaceDetectorOptions.PERFORMANCE_MODE_FAST
        FacePerformanceMode.ACCURATE -> com.google.mlkit.vision.face.FaceDetectorOptions.PERFORMANCE_MODE_ACCURATE
    }