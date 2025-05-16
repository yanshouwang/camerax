package dev.hebei.camerax_android.ml.face

import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.FaceLandmarkTypeApi
import dev.hebei.camerax_android.PigeonApiFaceLandmarkApi

class FaceLandmarkImpl(impl: CameraXImpl) : PigeonApiFaceLandmarkApi(impl) {
    override fun type(pigeon_instance: com.google.mlkit.vision.face.FaceLandmark): FaceLandmarkTypeApi {
        return pigeon_instance.landmarkType.faceLandmarkTypeApi
    }

    override fun position(pigeon_instance: com.google.mlkit.vision.face.FaceLandmark): android.graphics.PointF {
        return pigeon_instance.position
    }
}

val FaceLandmarkTypeApi.impl
    get() = when (this) {
        FaceLandmarkTypeApi.LEFT_CHEEK -> com.google.mlkit.vision.face.FaceLandmark.LEFT_CHEEK
        FaceLandmarkTypeApi.LEFT_EAR -> com.google.mlkit.vision.face.FaceLandmark.LEFT_EAR
        FaceLandmarkTypeApi.LEFT_EYE -> com.google.mlkit.vision.face.FaceLandmark.LEFT_EYE
        FaceLandmarkTypeApi.MOUTH_BOTTOM -> com.google.mlkit.vision.face.FaceLandmark.MOUTH_BOTTOM
        FaceLandmarkTypeApi.MOUTH_LEFT -> com.google.mlkit.vision.face.FaceLandmark.MOUTH_LEFT
        FaceLandmarkTypeApi.MOUTH_RIGHT -> com.google.mlkit.vision.face.FaceLandmark.MOUTH_RIGHT
        FaceLandmarkTypeApi.NOSE_BASE -> com.google.mlkit.vision.face.FaceLandmark.NOSE_BASE
        FaceLandmarkTypeApi.RIGHT_CHEEK -> com.google.mlkit.vision.face.FaceLandmark.RIGHT_CHEEK
        FaceLandmarkTypeApi.RIGHT_EAR -> com.google.mlkit.vision.face.FaceLandmark.RIGHT_EAR
        FaceLandmarkTypeApi.RIGHT_EYE -> com.google.mlkit.vision.face.FaceLandmark.RIGHT_EYE
    }

val Int.faceLandmarkTypeApi
    get() = when (this) {
        com.google.mlkit.vision.face.FaceLandmark.LEFT_CHEEK -> FaceLandmarkTypeApi.LEFT_CHEEK
        com.google.mlkit.vision.face.FaceLandmark.LEFT_EAR -> FaceLandmarkTypeApi.LEFT_EAR
        com.google.mlkit.vision.face.FaceLandmark.LEFT_EYE -> FaceLandmarkTypeApi.LEFT_EYE
        com.google.mlkit.vision.face.FaceLandmark.MOUTH_BOTTOM -> FaceLandmarkTypeApi.MOUTH_BOTTOM
        com.google.mlkit.vision.face.FaceLandmark.MOUTH_LEFT -> FaceLandmarkTypeApi.MOUTH_LEFT
        com.google.mlkit.vision.face.FaceLandmark.MOUTH_RIGHT -> FaceLandmarkTypeApi.MOUTH_RIGHT
        com.google.mlkit.vision.face.FaceLandmark.NOSE_BASE -> FaceLandmarkTypeApi.NOSE_BASE
        com.google.mlkit.vision.face.FaceLandmark.RIGHT_CHEEK -> FaceLandmarkTypeApi.RIGHT_CHEEK
        com.google.mlkit.vision.face.FaceLandmark.RIGHT_EAR -> FaceLandmarkTypeApi.RIGHT_EAR
        com.google.mlkit.vision.face.FaceLandmark.RIGHT_EYE -> FaceLandmarkTypeApi.RIGHT_EYE
        else -> throw IllegalArgumentException()
    }