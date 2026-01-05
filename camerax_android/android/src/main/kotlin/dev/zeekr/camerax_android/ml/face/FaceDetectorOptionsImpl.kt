package dev.zeekr.camerax_android.ml.face

import com.google.mlkit.vision.face.FaceDetectorOptions
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.FaceDetectorOptionsClassificationModeApi
import dev.zeekr.camerax_android.FaceDetectorOptionsContourModeApi
import dev.zeekr.camerax_android.FaceDetectorOptionsLandmarkModeApi
import dev.zeekr.camerax_android.FaceDetectorOptionsPerformanceModeApi
import dev.zeekr.camerax_android.PigeonApiFaceDetectorOptionsBuilderProxyApi
import dev.zeekr.camerax_android.PigeonApiFaceDetectorOptionsProxyApi
import dev.zeekr.camerax_android.PigeonApiFaceDetectorOptionsUtilProxyApi

class FaceDetectorOptionsImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiFaceDetectorOptionsProxyApi(registrar) {
    class BuilderImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
        PigeonApiFaceDetectorOptionsBuilderProxyApi(registrar) {
        override fun pigeon_defaultConstructor(): FaceDetectorOptions.Builder {
            return FaceDetectorOptions.Builder()
        }

        override fun enableTracking(pigeon_instance: FaceDetectorOptions.Builder): FaceDetectorOptions.Builder {
            return pigeon_instance.enableTracking()
        }

        override fun setClassificationMode(
            pigeon_instance: FaceDetectorOptions.Builder, classificationMode: Long
        ): FaceDetectorOptions.Builder {
            return pigeon_instance.setClassificationMode(classificationMode.toInt())
        }

        override fun setContourMode(
            pigeon_instance: FaceDetectorOptions.Builder, contourMode: Long
        ): FaceDetectorOptions.Builder {
            return pigeon_instance.setContourMode(contourMode.toInt())
        }

        override fun setLandmarkMode(
            pigeon_instance: FaceDetectorOptions.Builder, landmarkMode: Long
        ): FaceDetectorOptions.Builder {
            return pigeon_instance.setLandmarkMode(landmarkMode.toInt())
        }

        override fun setMinFaceSize(
            pigeon_instance: FaceDetectorOptions.Builder, minFaceSize: Double
        ): FaceDetectorOptions.Builder {
            return pigeon_instance.setMinFaceSize(minFaceSize.toFloat())
        }

        override fun setPerformanceMode(
            pigeon_instance: FaceDetectorOptions.Builder, performanceMode: Long
        ): FaceDetectorOptions.Builder {
            return pigeon_instance.setPerformanceMode(performanceMode.toInt())
        }

        override fun build(pigeon_instance: FaceDetectorOptions.Builder): FaceDetectorOptions {
            return pigeon_instance.build()
        }
    }

    class UtilImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiFaceDetectorOptionsUtilProxyApi(registrar) {
        override fun fromClassificationMode(value: Long): FaceDetectorOptionsClassificationModeApi {
            return Util.fromClassificationMode(value.toInt())
        }

        override fun fromContourMode(value: Long): FaceDetectorOptionsContourModeApi {
            return Util.fromContourMode(value.toInt())
        }

        override fun fromLandmarkMode(value: Long): FaceDetectorOptionsLandmarkModeApi {
            return Util.fromLandmarkMode(value.toInt())
        }

        override fun fromPerformanceMode(value: Long): FaceDetectorOptionsPerformanceModeApi {
            return Util.fromPerformanceMode(value.toInt())
        }

        override fun toClassificationMode(api: FaceDetectorOptionsClassificationModeApi): Long {
            return Util.toClassificationMode(api).toLong()
        }

        override fun toContourMode(api: FaceDetectorOptionsContourModeApi): Long {
            return Util.toContourMode(api).toLong()
        }

        override fun toLandmarkMode(api: FaceDetectorOptionsLandmarkModeApi): Long {
            return Util.toLandmarkMode(api).toLong()
        }

        override fun toPerformanceMode(api: FaceDetectorOptionsPerformanceModeApi): Long {
            return Util.toPerformanceMode(api).toLong()
        }
    }

    object Util {
        fun fromClassificationMode(value: Int): FaceDetectorOptionsClassificationModeApi {
            return when (value) {
                FaceDetectorOptions.CLASSIFICATION_MODE_NONE -> FaceDetectorOptionsClassificationModeApi.NONE
                FaceDetectorOptions.CLASSIFICATION_MODE_ALL -> FaceDetectorOptionsClassificationModeApi.ALL
                else -> throw NotImplementedError("Not implemented value: $this")
            }
        }

        fun fromContourMode(value: Int): FaceDetectorOptionsContourModeApi {
            return when (value) {
                FaceDetectorOptions.CONTOUR_MODE_NONE -> FaceDetectorOptionsContourModeApi.NONE
                FaceDetectorOptions.CONTOUR_MODE_ALL -> FaceDetectorOptionsContourModeApi.ALL
                else -> throw NotImplementedError("Not implemented value: $this")
            }
        }

        fun fromLandmarkMode(value: Int): FaceDetectorOptionsLandmarkModeApi {
            return when (value) {
                FaceDetectorOptions.LANDMARK_MODE_NONE -> FaceDetectorOptionsLandmarkModeApi.NONE
                FaceDetectorOptions.LANDMARK_MODE_ALL -> FaceDetectorOptionsLandmarkModeApi.ALL
                else -> throw NotImplementedError("Not implemented value: $this")
            }
        }

        fun fromPerformanceMode(value: Int): FaceDetectorOptionsPerformanceModeApi {
            return when (value) {
                FaceDetectorOptions.PERFORMANCE_MODE_FAST -> FaceDetectorOptionsPerformanceModeApi.FAST
                FaceDetectorOptions.PERFORMANCE_MODE_ACCURATE -> FaceDetectorOptionsPerformanceModeApi.ACCURATE
                else -> throw NotImplementedError("Not implemented value: $this")
            }
        }

        fun toClassificationMode(api: FaceDetectorOptionsClassificationModeApi): Int {
            return when (api) {
                FaceDetectorOptionsClassificationModeApi.NONE -> FaceDetectorOptions.CLASSIFICATION_MODE_NONE
                FaceDetectorOptionsClassificationModeApi.ALL -> FaceDetectorOptions.CLASSIFICATION_MODE_ALL
            }
        }

        fun toContourMode(api: FaceDetectorOptionsContourModeApi): Int {
            return when (api) {
                FaceDetectorOptionsContourModeApi.NONE -> FaceDetectorOptions.CONTOUR_MODE_NONE
                FaceDetectorOptionsContourModeApi.ALL -> FaceDetectorOptions.CONTOUR_MODE_ALL
            }
        }

        fun toLandmarkMode(api: FaceDetectorOptionsLandmarkModeApi): Int {
            return when (api) {
                FaceDetectorOptionsLandmarkModeApi.NONE -> FaceDetectorOptions.LANDMARK_MODE_NONE
                FaceDetectorOptionsLandmarkModeApi.ALL -> FaceDetectorOptions.LANDMARK_MODE_ALL
            }
        }

        fun toPerformanceMode(api: FaceDetectorOptionsPerformanceModeApi): Int {
            return when (api) {
                FaceDetectorOptionsPerformanceModeApi.FAST -> FaceDetectorOptions.PERFORMANCE_MODE_FAST
                FaceDetectorOptionsPerformanceModeApi.ACCURATE -> FaceDetectorOptions.PERFORMANCE_MODE_ACCURATE
            }
        }
    }

    override fun build(
        enableTracking: Boolean?,
        classificationMode: Long?,
        contourMode: Long?,
        landmarkMode: Long?,
        minFaceSize: Double?,
        performanceMode: Long?
    ): FaceDetectorOptions {
        val builder = FaceDetectorOptions.Builder()
        if (enableTracking == true) {
            builder.enableTracking()
        }
        if (classificationMode != null) {
            builder.setClassificationMode(classificationMode.toInt())
        }
        if (contourMode != null) {
            builder.setContourMode(contourMode.toInt())
        }
        if (landmarkMode != null) {
            builder.setLandmarkMode(landmarkMode.toInt())
        }
        if (minFaceSize != null) {
            builder.setMinFaceSize(minFaceSize.toFloat())
        }
        if (performanceMode != null) {
            builder.setPerformanceMode(performanceMode.toInt())
        }
        return builder.build()
    }
}
