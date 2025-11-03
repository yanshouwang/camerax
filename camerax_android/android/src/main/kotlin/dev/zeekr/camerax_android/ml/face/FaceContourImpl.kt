package dev.zeekr.camerax_android.ml.face

import android.graphics.PointF
import com.google.mlkit.vision.face.FaceContour
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.FaceContourTypeApi
import dev.zeekr.camerax_android.PigeonApiFaceContourApi

class FaceContourImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiFaceContourApi(registrar) {
    override fun type(pigeon_instance: FaceContour): FaceContourTypeApi {
        return pigeon_instance.faceContourType.faceContourTypeApi
    }

    override fun points(pigeon_instance: FaceContour): List<PointF> {
        return pigeon_instance.points
    }
}

val FaceContourTypeApi.impl: Int
    get() = when (this) {
        FaceContourTypeApi.FACE -> FaceContour.FACE
        FaceContourTypeApi.LEFT_CHEEK -> FaceContour.LEFT_CHEEK
        FaceContourTypeApi.LEFT_EYE -> FaceContour.LEFT_EYE
        FaceContourTypeApi.LEFT_EYEBROW_BOTTOM -> FaceContour.LEFT_EYEBROW_BOTTOM
        FaceContourTypeApi.LEFT_EYEBROW_TOP -> FaceContour.LEFT_EYEBROW_TOP
        FaceContourTypeApi.LOWER_LIP_BOTTOM -> FaceContour.LOWER_LIP_BOTTOM
        FaceContourTypeApi.LOWER_LIP_TOP -> FaceContour.LOWER_LIP_TOP
        FaceContourTypeApi.NOSE_BOTTOM -> FaceContour.NOSE_BOTTOM
        FaceContourTypeApi.NOSE_BRIDGE -> FaceContour.NOSE_BRIDGE
        FaceContourTypeApi.RIGHT_CHEEK -> FaceContour.RIGHT_CHEEK
        FaceContourTypeApi.RIGHT_EYE -> FaceContour.RIGHT_EYE
        FaceContourTypeApi.RIGHT_EYEBROW_BOTTOM -> FaceContour.RIGHT_EYEBROW_BOTTOM
        FaceContourTypeApi.RIGHT_EYEBROW_TOP -> FaceContour.RIGHT_EYEBROW_TOP
        FaceContourTypeApi.UPPER_LIP_BOTTOM -> FaceContour.UPPER_LIP_BOTTOM
        FaceContourTypeApi.UPPER_LIP_TOP -> FaceContour.UPPER_LIP_TOP
    }

val Int.faceContourTypeApi: FaceContourTypeApi
    get() = when (this) {
        FaceContour.FACE -> FaceContourTypeApi.FACE
        FaceContour.LEFT_CHEEK -> FaceContourTypeApi.LEFT_CHEEK
        FaceContour.LEFT_EYE -> FaceContourTypeApi.LEFT_EYE
        FaceContour.LEFT_EYEBROW_BOTTOM -> FaceContourTypeApi.LEFT_EYEBROW_BOTTOM
        FaceContour.LEFT_EYEBROW_TOP -> FaceContourTypeApi.LEFT_EYEBROW_TOP
        FaceContour.LOWER_LIP_BOTTOM -> FaceContourTypeApi.LOWER_LIP_BOTTOM
        FaceContour.LOWER_LIP_TOP -> FaceContourTypeApi.LOWER_LIP_TOP
        FaceContour.NOSE_BOTTOM -> FaceContourTypeApi.NOSE_BOTTOM
        FaceContour.NOSE_BRIDGE -> FaceContourTypeApi.NOSE_BRIDGE
        FaceContour.RIGHT_CHEEK -> FaceContourTypeApi.RIGHT_CHEEK
        FaceContour.RIGHT_EYE -> FaceContourTypeApi.RIGHT_EYE
        FaceContour.RIGHT_EYEBROW_BOTTOM -> FaceContourTypeApi.RIGHT_EYEBROW_BOTTOM
        FaceContour.RIGHT_EYEBROW_TOP -> FaceContourTypeApi.RIGHT_EYEBROW_TOP
        FaceContour.UPPER_LIP_BOTTOM -> FaceContourTypeApi.UPPER_LIP_BOTTOM
        FaceContour.UPPER_LIP_TOP -> FaceContourTypeApi.UPPER_LIP_TOP
        else -> throw NotImplementedError("Not implemented value: $this")
    }