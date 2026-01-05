package dev.zeekr.camerax_android.ml.face

import com.google.mlkit.vision.face.FaceLandmark
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.FaceLandmarkTypeApi
import dev.zeekr.camerax_android.PigeonApiFaceLandmarkProxyApi
import dev.zeekr.camerax_android.PigeonApiFaceLandmarkUtilProxyApi

class FaceLandmarkImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiFaceLandmarkProxyApi(registrar) {
    class UtilImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiFaceLandmarkUtilProxyApi(registrar) {
        override fun fromType(value: Long): FaceLandmarkTypeApi {
            return Util.fromType(value.toInt())
        }

        override fun toType(api: FaceLandmarkTypeApi): Long {
            return Util.toType(api).toLong()
        }
    }

    object Util {
        fun fromType(value: Int): FaceLandmarkTypeApi {
            return when (value) {
                FaceLandmark.LEFT_CHEEK -> FaceLandmarkTypeApi.LEFT_CHEEK
                FaceLandmark.LEFT_EAR -> FaceLandmarkTypeApi.LEFT_EAR
                FaceLandmark.LEFT_EYE -> FaceLandmarkTypeApi.LEFT_EYE
                FaceLandmark.MOUTH_BOTTOM -> FaceLandmarkTypeApi.MOUTH_BOTTOM
                FaceLandmark.MOUTH_LEFT -> FaceLandmarkTypeApi.MOUTH_LEFT
                FaceLandmark.MOUTH_RIGHT -> FaceLandmarkTypeApi.MOUTH_RIGHT
                FaceLandmark.NOSE_BASE -> FaceLandmarkTypeApi.NOSE_BASE
                FaceLandmark.RIGHT_CHEEK -> FaceLandmarkTypeApi.RIGHT_CHEEK
                FaceLandmark.RIGHT_EAR -> FaceLandmarkTypeApi.RIGHT_EAR
                FaceLandmark.RIGHT_EYE -> FaceLandmarkTypeApi.RIGHT_EYE
                else -> throw NotImplementedError("Not implemented value: $this")
            }
        }

        fun toType(api: FaceLandmarkTypeApi): Int {
            return when (api) {
                FaceLandmarkTypeApi.LEFT_CHEEK -> FaceLandmark.LEFT_CHEEK
                FaceLandmarkTypeApi.LEFT_EAR -> FaceLandmark.LEFT_EAR
                FaceLandmarkTypeApi.LEFT_EYE -> FaceLandmark.LEFT_EYE
                FaceLandmarkTypeApi.MOUTH_BOTTOM -> FaceLandmark.MOUTH_BOTTOM
                FaceLandmarkTypeApi.MOUTH_LEFT -> FaceLandmark.MOUTH_LEFT
                FaceLandmarkTypeApi.MOUTH_RIGHT -> FaceLandmark.MOUTH_RIGHT
                FaceLandmarkTypeApi.NOSE_BASE -> FaceLandmark.NOSE_BASE
                FaceLandmarkTypeApi.RIGHT_CHEEK -> FaceLandmark.RIGHT_CHEEK
                FaceLandmarkTypeApi.RIGHT_EAR -> FaceLandmark.RIGHT_EAR
                FaceLandmarkTypeApi.RIGHT_EYE -> FaceLandmark.RIGHT_EYE
            }
        }
    }

    override fun type(pigeon_instance: FaceLandmark): Long {
        return pigeon_instance.landmarkType.toLong()
    }

    override fun position(pigeon_instance: FaceLandmark): android.graphics.PointF {
        return pigeon_instance.position
    }
}
