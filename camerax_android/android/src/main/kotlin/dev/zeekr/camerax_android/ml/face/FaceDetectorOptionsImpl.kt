package dev.zeekr.camerax_android.ml.face

import com.google.mlkit.vision.face.FaceDetectorOptions
import dev.zeekr.camerax_android.CameraXImpl
import dev.zeekr.camerax_android.FaceClassificationModeApi
import dev.zeekr.camerax_android.FaceContourModeApi
import dev.zeekr.camerax_android.FaceLandmarkModeApi
import dev.zeekr.camerax_android.FacePerformanceModeApi
import dev.zeekr.camerax_android.PigeonApiFaceDetectorOptionsApi

class FaceDetectorOptionsImpl(impl: CameraXImpl) : PigeonApiFaceDetectorOptionsApi(impl) {
    override fun build(
        enableTracking: Boolean?,
        classificationMode: FaceClassificationModeApi?,
        contourMode: FaceContourModeApi?,
        landmarkMode: FaceLandmarkModeApi?,
        minFaceSize: Double?,
        performanceMode: FacePerformanceModeApi?
    ): FaceDetectorOptions {
        val builder = FaceDetectorOptions.Builder()
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
        FaceClassificationModeApi.NONE -> FaceDetectorOptions.CLASSIFICATION_MODE_NONE
        FaceClassificationModeApi.ALL -> FaceDetectorOptions.CLASSIFICATION_MODE_ALL
    }

val FaceContourModeApi.impl
    get() = when (this) {
        FaceContourModeApi.NONE -> FaceDetectorOptions.CONTOUR_MODE_NONE
        FaceContourModeApi.ALL -> FaceDetectorOptions.CONTOUR_MODE_ALL
    }

val FaceLandmarkModeApi.impl
    get() = when (this) {
        FaceLandmarkModeApi.NONE -> FaceDetectorOptions.LANDMARK_MODE_NONE
        FaceLandmarkModeApi.ALL -> FaceDetectorOptions.LANDMARK_MODE_ALL
    }

val FacePerformanceModeApi.impl
    get() = when (this) {
        FacePerformanceModeApi.FAST -> FaceDetectorOptions.PERFORMANCE_MODE_FAST
        FacePerformanceModeApi.ACCURATE -> FaceDetectorOptions.PERFORMANCE_MODE_ACCURATE
    }