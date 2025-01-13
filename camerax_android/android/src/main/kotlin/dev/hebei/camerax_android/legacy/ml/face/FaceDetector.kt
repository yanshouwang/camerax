package dev.hebei.camerax_android.legacy.ml.face

import com.google.android.gms.tasks.Task
import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiFaceDetector
import dev.hebei.camerax_android.legacy.ml.Detector

class FaceDetector(registrar: CameraXRegistrar) : PigeonApiFaceDetector(registrar) {
    override fun pigeon_defaultConstructor(options: com.google.mlkit.vision.face.FaceDetectorOptions?): Stub {
        val obj = if (options == null) com.google.mlkit.vision.face.FaceDetection.getClient()
        else com.google.mlkit.vision.face.FaceDetection.getClient(options)
        return Stub(obj)
    }

    override fun process0(
        pigeon_instance: Stub,
        image: com.google.android.odml.image.MlImage,
        callback: (Result<List<com.google.mlkit.vision.face.Face>>) -> Unit
    ) {
        pigeon_instance.process(image).addOnSuccessListener { value ->
            callback(Result.success(value))
        }.addOnFailureListener { exception ->
            callback(Result.failure(exception))
        }
    }

    override fun process1(
        pigeon_instance: Stub,
        image: com.google.mlkit.vision.common.InputImage,
        callback: (Result<List<com.google.mlkit.vision.face.Face>>) -> Unit
    ) {
        pigeon_instance.process(image).addOnSuccessListener { value ->
            callback(Result.success(value))
        }.addOnFailureListener { exception ->
            callback(Result.failure(exception))
        }
    }

    class Stub internal constructor(override val obj: com.google.mlkit.vision.face.FaceDetector) :
        Detector.Stub(obj) {
        fun process(image: com.google.android.odml.image.MlImage): Task<List<com.google.mlkit.vision.face.Face>> {
            return obj.process(image)
        }

        fun process(image: com.google.mlkit.vision.common.InputImage): Task<List<com.google.mlkit.vision.face.Face>> {
            return obj.process(image)
        }
    }
}