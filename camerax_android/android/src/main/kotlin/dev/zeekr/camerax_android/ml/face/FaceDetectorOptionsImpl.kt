package dev.zeekr.camerax_android.ml.face

import com.google.mlkit.vision.face.FaceDetectorOptions
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.FaceDetectorOptionsClassificationModeApi
import dev.zeekr.camerax_android.FaceDetectorOptionsContourModeApi
import dev.zeekr.camerax_android.FaceDetectorOptionsLandmarkModeApi
import dev.zeekr.camerax_android.FaceDetectorOptionsPerformanceModeApi
import dev.zeekr.camerax_android.PigeonApiFaceDetectorOptionsApi

class FaceDetectorOptionsImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiFaceDetectorOptionsApi(registrar) {
    override fun build(
        enableTracking: Boolean?,
        classificationMode: FaceDetectorOptionsClassificationModeApi?,
        contourMode: FaceDetectorOptionsContourModeApi?,
        landmarkMode: FaceDetectorOptionsLandmarkModeApi?,
        minFaceSize: Double?,
        performanceMode: FaceDetectorOptionsPerformanceModeApi?
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

val FaceDetectorOptionsClassificationModeApi.impl: Int
    get() = when (this) {
        FaceDetectorOptionsClassificationModeApi.NONE -> FaceDetectorOptions.CLASSIFICATION_MODE_NONE
        FaceDetectorOptionsClassificationModeApi.ALL -> FaceDetectorOptions.CLASSIFICATION_MODE_ALL
    }

val FaceDetectorOptionsContourModeApi.impl: Int
    get() = when (this) {
        FaceDetectorOptionsContourModeApi.NONE -> FaceDetectorOptions.CONTOUR_MODE_NONE
        FaceDetectorOptionsContourModeApi.ALL -> FaceDetectorOptions.CONTOUR_MODE_ALL
    }

val FaceDetectorOptionsLandmarkModeApi.impl: Int
    get() = when (this) {
        FaceDetectorOptionsLandmarkModeApi.NONE -> FaceDetectorOptions.LANDMARK_MODE_NONE
        FaceDetectorOptionsLandmarkModeApi.ALL -> FaceDetectorOptions.LANDMARK_MODE_ALL
    }

val FaceDetectorOptionsPerformanceModeApi.impl: Int
    get() = when (this) {
        FaceDetectorOptionsPerformanceModeApi.FAST -> FaceDetectorOptions.PERFORMANCE_MODE_FAST
        FaceDetectorOptionsPerformanceModeApi.ACCURATE -> FaceDetectorOptions.PERFORMANCE_MODE_ACCURATE
    }