package dev.hebei.camerax_android.legacy.ml

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiFaceDetection

class FaceDetection(registrar: CameraXRegistrar) : PigeonApiFaceDetection(registrar) {
    override fun getClient(options: com.google.mlkit.vision.face.FaceDetectorOptions?): FaceDetector.Stub {
        val obj = if (options == null) com.google.mlkit.vision.face.FaceDetection.getClient()
        else com.google.mlkit.vision.face.FaceDetection.getClient(options)
        return FaceDetector.Stub(obj)
    }
}