package dev.hebei.camerax_android.ml.face

import com.google.mlkit.vision.face.Face
import com.google.mlkit.vision.face.FaceContour
import com.google.mlkit.vision.face.FaceLandmark
import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.FaceContourTypeApi
import dev.hebei.camerax_android.FaceLandmarkTypeApi
import dev.hebei.camerax_android.PigeonApiFaceApi

class FaceImpl(impl: CameraXImpl) : PigeonApiFaceApi(impl) {
    override fun boundingBox(pigeon_instance: Face): android.graphics.Rect {
        return pigeon_instance.boundingBox
    }

    override fun allContours(pigeon_instance: Face): List<FaceContour> {
        return pigeon_instance.allContours
    }

    override fun allLandmarks(pigeon_instance: Face): List<FaceLandmark> {
        return pigeon_instance.allLandmarks
    }

    override fun getContour(pigeon_instance: Face, contourType: FaceContourTypeApi): FaceContour? {
        return pigeon_instance.getContour(contourType.impl)
    }

    override fun getLandmark(pigeon_instance: Face, landmarkType: FaceLandmarkTypeApi): FaceLandmark? {
        return pigeon_instance.getLandmark(landmarkType.impl)
    }

    override fun headEulerAngleX(pigeon_instance: Face): Double {
        return pigeon_instance.headEulerAngleX.toDouble()
    }

    override fun headEulerAngleY(pigeon_instance: Face): Double {
        return pigeon_instance.headEulerAngleY.toDouble()
    }

    override fun headEulerAngleZ(pigeon_instance: Face): Double {
        return pigeon_instance.headEulerAngleZ.toDouble()
    }

    override fun leftEyeOpenProbability(pigeon_instance: Face): Double? {
        return pigeon_instance.leftEyeOpenProbability?.toDouble()
    }

    override fun rightEyeOpenProbability(pigeon_instance: Face): Double? {
        return pigeon_instance.rightEyeOpenProbability?.toDouble()
    }

    override fun smilingProbability(pigeon_instance: Face): Double? {
        return pigeon_instance.smilingProbability?.toDouble()
    }

    override fun trackingId(pigeon_instance: Face): Long? {
        return pigeon_instance.trackingId?.toLong()
    }
}