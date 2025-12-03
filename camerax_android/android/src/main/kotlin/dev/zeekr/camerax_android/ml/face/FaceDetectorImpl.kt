package dev.zeekr.camerax_android.ml.face

import com.google.mlkit.vision.common.InputImage
import com.google.mlkit.vision.face.Face
import com.google.mlkit.vision.face.FaceDetection
import com.google.mlkit.vision.face.FaceDetector
import com.google.mlkit.vision.face.FaceDetectorOptions
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiFaceDetectorProxyApi

class FaceDetectorImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiFaceDetectorProxyApi(registrar) {
    override fun pigeon_defaultConstructor(): FaceDetector {
        return FaceDetection.getClient()
    }

    override fun options(options: FaceDetectorOptions): FaceDetector {
        return FaceDetection.getClient(options)
    }

    override fun process(pigeon_instance: FaceDetector, image: InputImage, callback: (Result<List<Face>>) -> Unit) {
        pigeon_instance.process(image).addOnSuccessListener { callback(Result.success(it)) }
            .addOnFailureListener { callback(Result.failure(it)) }
    }
}