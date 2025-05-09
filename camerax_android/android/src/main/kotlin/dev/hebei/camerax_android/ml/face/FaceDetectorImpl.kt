package dev.hebei.camerax_android.ml.face

import com.google.android.gms.tasks.Task
import dev.hebei.camerax_android.CameraXRegistrar
import dev.hebei.camerax_android.PigeonApiFaceDetectorApi
import dev.hebei.camerax_android.ml.Detector

class FaceDetectorImpl(registrar: CameraXRegistrar) : PigeonApiFaceDetectorApi(registrar) {
    override fun pigeon_defaultConstructor(options: com.google.mlkit.vision.face.FaceDetectorOptions?): FaceDetector {
        val obj = if (options == null) com.google.mlkit.vision.face.FaceDetection.getClient()
        else com.google.mlkit.vision.face.FaceDetection.getClient(options)
        return FaceDetector(obj)
    }

    override fun process0(
        pigeon_instance: FaceDetector,
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
        pigeon_instance: FaceDetector,
        image: com.google.mlkit.vision.common.InputImage,
        callback: (Result<List<com.google.mlkit.vision.face.Face>>) -> Unit
    ) {
        pigeon_instance.process(image).addOnSuccessListener { value ->
            callback(Result.success(value))
        }.addOnFailureListener { exception ->
            callback(Result.failure(exception))
        }
    }
}

class FaceDetector internal constructor(override val obj: com.google.mlkit.vision.face.FaceDetector) : Detector(obj) {
    fun process(image: com.google.android.odml.image.MlImage): Task<List<com.google.mlkit.vision.face.Face>> {
        return obj.process(image)
    }

    fun process(image: com.google.mlkit.vision.common.InputImage): Task<List<com.google.mlkit.vision.face.Face>> {
        return obj.process(image)
    }
}