package dev.hebei.camerax_android.ml.face

import dev.hebei.camerax_android.CameraXRegistrar
import dev.hebei.camerax_android.FaceContourTypeApi
import dev.hebei.camerax_android.PigeonApiFaceContourApi

class FaceContourImpl(registrar: CameraXRegistrar) : PigeonApiFaceContourApi(registrar) {
    override fun type(pigeon_instance: com.google.mlkit.vision.face.FaceContour): FaceContourTypeApi {
        return pigeon_instance.faceContourType.faceContourTypeApi
    }

    override fun points(pigeon_instance: com.google.mlkit.vision.face.FaceContour): List<android.graphics.PointF> {
        return pigeon_instance.points
    }
}

val FaceContourTypeApi.impl
    get() = when (this) {
        FaceContourTypeApi.FACE -> com.google.mlkit.vision.face.FaceContour.FACE
        FaceContourTypeApi.LEFT_CHEEK -> com.google.mlkit.vision.face.FaceContour.LEFT_CHEEK
        FaceContourTypeApi.LEFT_EYE -> com.google.mlkit.vision.face.FaceContour.LEFT_EYE
        FaceContourTypeApi.LEFT_EYEBROW_BOTTOM -> com.google.mlkit.vision.face.FaceContour.LEFT_EYEBROW_BOTTOM
        FaceContourTypeApi.LEFT_EYEBROW_TOP -> com.google.mlkit.vision.face.FaceContour.LEFT_EYEBROW_TOP
        FaceContourTypeApi.LOWER_LIP_BOTTOM -> com.google.mlkit.vision.face.FaceContour.LOWER_LIP_BOTTOM
        FaceContourTypeApi.LOWER_LIP_TOP -> com.google.mlkit.vision.face.FaceContour.LOWER_LIP_TOP
        FaceContourTypeApi.NOSE_BOTTOM -> com.google.mlkit.vision.face.FaceContour.NOSE_BOTTOM
        FaceContourTypeApi.NOSE_BRIDGE -> com.google.mlkit.vision.face.FaceContour.NOSE_BRIDGE
        FaceContourTypeApi.RIGHT_CHEEK -> com.google.mlkit.vision.face.FaceContour.RIGHT_CHEEK
        FaceContourTypeApi.RIGHT_EYE -> com.google.mlkit.vision.face.FaceContour.RIGHT_EYE
        FaceContourTypeApi.RIGHT_EYEBROW_BOTTOM -> com.google.mlkit.vision.face.FaceContour.RIGHT_EYEBROW_BOTTOM
        FaceContourTypeApi.RIGHT_EYEBROW_TOP -> com.google.mlkit.vision.face.FaceContour.RIGHT_EYEBROW_TOP
        FaceContourTypeApi.UPPER_LIP_BOTTOM -> com.google.mlkit.vision.face.FaceContour.UPPER_LIP_BOTTOM
        FaceContourTypeApi.UPPER_LIP_TOP -> com.google.mlkit.vision.face.FaceContour.UPPER_LIP_TOP
    }

val Int.faceContourTypeApi
    get() = when (this) {
        com.google.mlkit.vision.face.FaceContour.FACE -> FaceContourTypeApi.FACE
        com.google.mlkit.vision.face.FaceContour.LEFT_CHEEK -> FaceContourTypeApi.LEFT_CHEEK
        com.google.mlkit.vision.face.FaceContour.LEFT_EYE -> FaceContourTypeApi.LEFT_EYE
        com.google.mlkit.vision.face.FaceContour.LEFT_EYEBROW_BOTTOM -> FaceContourTypeApi.LEFT_EYEBROW_BOTTOM
        com.google.mlkit.vision.face.FaceContour.LEFT_EYEBROW_TOP -> FaceContourTypeApi.LEFT_EYEBROW_TOP
        com.google.mlkit.vision.face.FaceContour.LOWER_LIP_BOTTOM -> FaceContourTypeApi.LOWER_LIP_BOTTOM
        com.google.mlkit.vision.face.FaceContour.LOWER_LIP_TOP -> FaceContourTypeApi.LOWER_LIP_TOP
        com.google.mlkit.vision.face.FaceContour.NOSE_BOTTOM -> FaceContourTypeApi.NOSE_BOTTOM
        com.google.mlkit.vision.face.FaceContour.NOSE_BRIDGE -> FaceContourTypeApi.NOSE_BRIDGE
        com.google.mlkit.vision.face.FaceContour.RIGHT_CHEEK -> FaceContourTypeApi.RIGHT_CHEEK
        com.google.mlkit.vision.face.FaceContour.RIGHT_EYE -> FaceContourTypeApi.RIGHT_EYE
        com.google.mlkit.vision.face.FaceContour.RIGHT_EYEBROW_BOTTOM -> FaceContourTypeApi.RIGHT_EYEBROW_BOTTOM
        com.google.mlkit.vision.face.FaceContour.RIGHT_EYEBROW_TOP -> FaceContourTypeApi.RIGHT_EYEBROW_TOP
        com.google.mlkit.vision.face.FaceContour.UPPER_LIP_BOTTOM -> FaceContourTypeApi.UPPER_LIP_BOTTOM
        com.google.mlkit.vision.face.FaceContour.UPPER_LIP_TOP -> FaceContourTypeApi.UPPER_LIP_TOP
        else -> throw IllegalArgumentException()
    }