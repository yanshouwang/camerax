package dev.hebei.camerax_android.legacy.ml

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.FaceContourType
import dev.hebei.camerax_android.legacy.PigeonApiFaceContour

class FaceContour(registrar: CameraXRegistrar) : PigeonApiFaceContour(registrar) {
    override fun getType(pigeon_instance: com.google.mlkit.vision.face.FaceContour): FaceContourType {
        return pigeon_instance.faceContourType.faceContourTypeArgs
    }

    override fun getPoints(pigeon_instance: com.google.mlkit.vision.face.FaceContour): List<android.graphics.PointF> {
        return pigeon_instance.points
    }
}

val FaceContourType.obj
    get() = when (this) {
        FaceContourType.FACE -> com.google.mlkit.vision.face.FaceContour.FACE
        FaceContourType.LEFT_CHEEK -> com.google.mlkit.vision.face.FaceContour.LEFT_CHEEK
        FaceContourType.LEFT_EYE -> com.google.mlkit.vision.face.FaceContour.LEFT_EYE
        FaceContourType.LEFT_EYEBROW_BOTTOM -> com.google.mlkit.vision.face.FaceContour.LEFT_EYEBROW_BOTTOM
        FaceContourType.LEFT_EYEBROW_TOP -> com.google.mlkit.vision.face.FaceContour.LEFT_EYEBROW_TOP
        FaceContourType.LOWER_LIP_BOTTOM -> com.google.mlkit.vision.face.FaceContour.LOWER_LIP_BOTTOM
        FaceContourType.LOWER_LIP_TOP -> com.google.mlkit.vision.face.FaceContour.LOWER_LIP_TOP
        FaceContourType.NOSE_BOTTOM -> com.google.mlkit.vision.face.FaceContour.NOSE_BOTTOM
        FaceContourType.NOSE_BRIDGE -> com.google.mlkit.vision.face.FaceContour.NOSE_BRIDGE
        FaceContourType.RIGHT_CHEEK -> com.google.mlkit.vision.face.FaceContour.RIGHT_CHEEK
        FaceContourType.RIGHT_EYE -> com.google.mlkit.vision.face.FaceContour.RIGHT_EYE
        FaceContourType.RIGHT_EYEBROW_BOTTOM -> com.google.mlkit.vision.face.FaceContour.RIGHT_EYEBROW_BOTTOM
        FaceContourType.RIGHT_EYEBROW_TOP -> com.google.mlkit.vision.face.FaceContour.RIGHT_EYEBROW_TOP
        FaceContourType.UPPER_LIP_BOTTOM -> com.google.mlkit.vision.face.FaceContour.UPPER_LIP_BOTTOM
        FaceContourType.UPPER_LIP_TOP -> com.google.mlkit.vision.face.FaceContour.UPPER_LIP_TOP
    }

val Int.faceContourTypeArgs
    get() = when (this) {
        com.google.mlkit.vision.face.FaceContour.FACE -> FaceContourType.FACE
        com.google.mlkit.vision.face.FaceContour.LEFT_CHEEK -> FaceContourType.LEFT_CHEEK
        com.google.mlkit.vision.face.FaceContour.LEFT_EYE -> FaceContourType.LEFT_EYE
        com.google.mlkit.vision.face.FaceContour.LEFT_EYEBROW_BOTTOM -> FaceContourType.LEFT_EYEBROW_BOTTOM
        com.google.mlkit.vision.face.FaceContour.LEFT_EYEBROW_TOP -> FaceContourType.LEFT_EYEBROW_TOP
        com.google.mlkit.vision.face.FaceContour.LOWER_LIP_BOTTOM -> FaceContourType.LOWER_LIP_BOTTOM
        com.google.mlkit.vision.face.FaceContour.LOWER_LIP_TOP -> FaceContourType.LOWER_LIP_TOP
        com.google.mlkit.vision.face.FaceContour.NOSE_BOTTOM -> FaceContourType.NOSE_BOTTOM
        com.google.mlkit.vision.face.FaceContour.NOSE_BRIDGE -> FaceContourType.NOSE_BRIDGE
        com.google.mlkit.vision.face.FaceContour.RIGHT_CHEEK -> FaceContourType.RIGHT_CHEEK
        com.google.mlkit.vision.face.FaceContour.RIGHT_EYE -> FaceContourType.RIGHT_EYE
        com.google.mlkit.vision.face.FaceContour.RIGHT_EYEBROW_BOTTOM -> FaceContourType.RIGHT_EYEBROW_BOTTOM
        com.google.mlkit.vision.face.FaceContour.RIGHT_EYEBROW_TOP -> FaceContourType.RIGHT_EYEBROW_TOP
        com.google.mlkit.vision.face.FaceContour.UPPER_LIP_BOTTOM -> FaceContourType.UPPER_LIP_BOTTOM
        com.google.mlkit.vision.face.FaceContour.UPPER_LIP_TOP -> FaceContourType.UPPER_LIP_TOP
        else -> throw IllegalArgumentException()
    }