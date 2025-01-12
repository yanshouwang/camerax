package dev.hebei.camerax_android.legacy.ml

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.FaceContourType
import dev.hebei.camerax_android.legacy.FaceLandmarkType
import dev.hebei.camerax_android.legacy.PigeonApiFace

class Face(registrar: CameraXRegistrar) : PigeonApiFace(registrar) {
    override fun getBoundingBox(pigeon_instance: com.google.mlkit.vision.face.Face): android.graphics.Rect {
        return pigeon_instance.boundingBox
    }

    override fun getAllContours(pigeon_instance: com.google.mlkit.vision.face.Face): List<com.google.mlkit.vision.face.FaceContour> {
        return pigeon_instance.allContours
    }

    override fun getAllLandmarks(pigeon_instance: com.google.mlkit.vision.face.Face): List<com.google.mlkit.vision.face.FaceLandmark> {
        return pigeon_instance.allLandmarks
    }

    override fun getContour(
        pigeon_instance: com.google.mlkit.vision.face.Face, contourType: FaceContourType
    ): com.google.mlkit.vision.face.FaceContour? {
        return pigeon_instance.getContour(contourType.obj)
    }

    override fun getLandmark(
        pigeon_instance: com.google.mlkit.vision.face.Face, landmarkType: FaceLandmarkType
    ): com.google.mlkit.vision.face.FaceLandmark? {
        return pigeon_instance.getLandmark(landmarkType.obj)
    }

    override fun getHeadEulerAngleX(pigeon_instance: com.google.mlkit.vision.face.Face): Double {
        return pigeon_instance.headEulerAngleX.toDouble()
    }

    override fun getHeadEulerAngleY(pigeon_instance: com.google.mlkit.vision.face.Face): Double {
        return pigeon_instance.headEulerAngleY.toDouble()
    }

    override fun getHeadEulerAngleZ(pigeon_instance: com.google.mlkit.vision.face.Face): Double {
        return pigeon_instance.headEulerAngleZ.toDouble()
    }

    override fun getLeftEyeOpenProbability(pigeon_instance: com.google.mlkit.vision.face.Face): Double? {
        return pigeon_instance.leftEyeOpenProbability?.toDouble()
    }

    override fun getRightEyeOpenProbability(pigeon_instance: com.google.mlkit.vision.face.Face): Double? {
        return pigeon_instance.rightEyeOpenProbability?.toDouble()
    }

    override fun getSmilingProbability(pigeon_instance: com.google.mlkit.vision.face.Face): Double? {
        return pigeon_instance.smilingProbability?.toDouble()
    }

    override fun getTrackingId(pigeon_instance: com.google.mlkit.vision.face.Face): Long? {
        return pigeon_instance.trackingId?.toLong()
    }
}