package dev.zeekr.camerax_android.ml.face

import com.google.mlkit.vision.face.FaceDetection
import com.google.mlkit.vision.face.FaceDetector
import com.google.mlkit.vision.face.FaceDetectorOptions
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiFaceDetectionApi

class FaceDetectionImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiFaceDetectionApi(registrar) {
    override fun getClient1(): FaceDetector {
        return FaceDetection.getClient()
    }

    override fun getClient2(options: FaceDetectorOptions): FaceDetector {
        return FaceDetection.getClient(options)
    }
}