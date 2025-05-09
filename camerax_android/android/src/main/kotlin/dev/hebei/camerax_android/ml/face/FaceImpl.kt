package dev.hebei.camerax_android.ml.face

import dev.hebei.camerax_android.CameraXRegistrar
import dev.hebei.camerax_android.FaceContourTypeApi
import dev.hebei.camerax_android.FaceLandmarkTypeApi
import dev.hebei.camerax_android.PigeonApiFaceApi

class FaceImpl(registrar: CameraXRegistrar) : PigeonApiFaceApi(registrar) {
    override fun boundingBox(pigeon_instance: com.google.mlkit.vision.face.Face): android.graphics.Rect {
        return pigeon_instance.boundingBox
    }

    override fun allContours(pigeon_instance: com.google.mlkit.vision.face.Face): List<com.google.mlkit.vision.face.FaceContour> {
        return pigeon_instance.allContours
    }

    override fun allLandmarks(pigeon_instance: com.google.mlkit.vision.face.Face): List<com.google.mlkit.vision.face.FaceLandmark> {
        return pigeon_instance.allLandmarks
    }

    override fun getContour(
        pigeon_instance: com.google.mlkit.vision.face.Face, contourType: FaceContourTypeApi
    ): com.google.mlkit.vision.face.FaceContour? {
        return pigeon_instance.getContour(contourType.impl)
    }

    override fun getLandmark(
        pigeon_instance: com.google.mlkit.vision.face.Face, landmarkType: FaceLandmarkTypeApi
    ): com.google.mlkit.vision.face.FaceLandmark? {
        return pigeon_instance.getLandmark(landmarkType.impl)
    }

    override fun headEulerAngleX(pigeon_instance: com.google.mlkit.vision.face.Face): Double {
        return pigeon_instance.headEulerAngleX.toDouble()
    }

    override fun headEulerAngleY(pigeon_instance: com.google.mlkit.vision.face.Face): Double {
        return pigeon_instance.headEulerAngleY.toDouble()
    }

    override fun headEulerAngleZ(pigeon_instance: com.google.mlkit.vision.face.Face): Double {
        return pigeon_instance.headEulerAngleZ.toDouble()
    }

    override fun leftEyeOpenProbability(pigeon_instance: com.google.mlkit.vision.face.Face): Double? {
        return pigeon_instance.leftEyeOpenProbability?.toDouble()
    }

    override fun rightEyeOpenProbability(pigeon_instance: com.google.mlkit.vision.face.Face): Double? {
        return pigeon_instance.rightEyeOpenProbability?.toDouble()
    }

    override fun smilingProbability(pigeon_instance: com.google.mlkit.vision.face.Face): Double? {
        return pigeon_instance.smilingProbability?.toDouble()
    }

    override fun trackingId(pigeon_instance: com.google.mlkit.vision.face.Face): Long? {
        return pigeon_instance.trackingId?.toLong()
    }
}