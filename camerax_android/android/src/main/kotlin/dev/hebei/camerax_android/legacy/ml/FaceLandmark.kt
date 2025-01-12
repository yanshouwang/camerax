package dev.hebei.camerax_android.legacy.ml

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.FaceLandmarkType
import dev.hebei.camerax_android.legacy.PigeonApiFaceLandmark

class FaceLandmark(registrar: CameraXRegistrar) : PigeonApiFaceLandmark(registrar) {
    override fun getType(pigeon_instance: com.google.mlkit.vision.face.FaceLandmark): FaceLandmarkType {
        return pigeon_instance.landmarkType.faceLandmarkTypeArgs
    }

    override fun getPosition(pigeon_instance: com.google.mlkit.vision.face.FaceLandmark): android.graphics.PointF {
        return pigeon_instance.position
    }
}

val FaceLandmarkType.obj
    get() = when (this) {
        FaceLandmarkType.LEFT_CHEEK -> com.google.mlkit.vision.face.FaceLandmark.LEFT_CHEEK
        FaceLandmarkType.LEFT_EAR -> com.google.mlkit.vision.face.FaceLandmark.LEFT_EAR
        FaceLandmarkType.LEFT_EYE -> com.google.mlkit.vision.face.FaceLandmark.LEFT_EYE
        FaceLandmarkType.MOUTH_BOTTOM -> com.google.mlkit.vision.face.FaceLandmark.MOUTH_BOTTOM
        FaceLandmarkType.MOUTH_LEFT -> com.google.mlkit.vision.face.FaceLandmark.MOUTH_LEFT
        FaceLandmarkType.MOUTH_RIGHT -> com.google.mlkit.vision.face.FaceLandmark.MOUTH_RIGHT
        FaceLandmarkType.NOSE_BASE -> com.google.mlkit.vision.face.FaceLandmark.NOSE_BASE
        FaceLandmarkType.RIGHT_CHEEK -> com.google.mlkit.vision.face.FaceLandmark.RIGHT_CHEEK
        FaceLandmarkType.RIGHT_EAR -> com.google.mlkit.vision.face.FaceLandmark.RIGHT_EAR
        FaceLandmarkType.RIGHT_EYE -> com.google.mlkit.vision.face.FaceLandmark.RIGHT_EYE
    }

val Int.faceLandmarkTypeArgs
    get() = when (this) {
        com.google.mlkit.vision.face.FaceLandmark.LEFT_CHEEK -> FaceLandmarkType.LEFT_CHEEK
        com.google.mlkit.vision.face.FaceLandmark.LEFT_EAR -> FaceLandmarkType.LEFT_EAR
        com.google.mlkit.vision.face.FaceLandmark.LEFT_EYE -> FaceLandmarkType.LEFT_EYE
        com.google.mlkit.vision.face.FaceLandmark.MOUTH_BOTTOM -> FaceLandmarkType.MOUTH_BOTTOM
        com.google.mlkit.vision.face.FaceLandmark.MOUTH_LEFT -> FaceLandmarkType.MOUTH_LEFT
        com.google.mlkit.vision.face.FaceLandmark.MOUTH_RIGHT -> FaceLandmarkType.MOUTH_RIGHT
        com.google.mlkit.vision.face.FaceLandmark.NOSE_BASE -> FaceLandmarkType.NOSE_BASE
        com.google.mlkit.vision.face.FaceLandmark.RIGHT_CHEEK -> FaceLandmarkType.RIGHT_CHEEK
        com.google.mlkit.vision.face.FaceLandmark.RIGHT_EAR -> FaceLandmarkType.RIGHT_EAR
        com.google.mlkit.vision.face.FaceLandmark.RIGHT_EYE -> FaceLandmarkType.RIGHT_EYE
        else -> throw IllegalArgumentException()
    }