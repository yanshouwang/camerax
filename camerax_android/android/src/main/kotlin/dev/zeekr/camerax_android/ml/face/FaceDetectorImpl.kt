package dev.zeekr.camerax_android.ml.face

import com.google.android.odml.image.MlImage
import com.google.mlkit.vision.common.InputImage
import com.google.mlkit.vision.face.Face
import com.google.mlkit.vision.face.FaceDetection
import com.google.mlkit.vision.face.FaceDetectorOptions
import dev.zeekr.camerax_android.CameraXImpl
import dev.zeekr.camerax_android.PigeonApiFaceDetectorApi
import dev.zeekr.camerax_android.ml.Detector

class FaceDetectorImpl(impl: CameraXImpl) : PigeonApiFaceDetectorApi(impl) {
    override fun pigeon_defaultConstructor(options: FaceDetectorOptions?): FaceDetector {
        val instance = if (options == null) FaceDetection.getClient()
        else FaceDetection.getClient(options)
        return FaceDetector(instance)
    }
}

class FaceDetector internal constructor(override val instance: com.google.mlkit.vision.face.FaceDetector) :
    Detector(instance)