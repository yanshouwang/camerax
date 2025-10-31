package dev.zeekr.camerax_android.ml.face

import com.google.mlkit.vision.face.FaceDetection
import com.google.mlkit.vision.face.FaceDetectorOptions
import dev.zeekr.camerax_android.CameraXRegistrarImpl
import dev.zeekr.camerax_android.PigeonApiFaceDetectorApi
import dev.zeekr.camerax_android.ml.Detector

class FaceDetectorImpl(impl: CameraXRegistrarImpl) : PigeonApiFaceDetectorApi(impl) {
    override fun pigeon_defaultConstructor(options: FaceDetectorOptions?): FaceDetector {
        val instance = if (options == null) FaceDetection.getClient()
        else FaceDetection.getClient(options)
        return FaceDetector(instance)
    }
}

class FaceDetector internal constructor(override val instance: com.google.mlkit.vision.face.FaceDetector) :
    Detector(instance)