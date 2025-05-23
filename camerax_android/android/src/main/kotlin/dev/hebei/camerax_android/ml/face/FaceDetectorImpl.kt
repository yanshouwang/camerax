package dev.hebei.camerax_android.ml.face

import com.google.android.gms.tasks.Task
import com.google.android.odml.image.MlImage
import com.google.mlkit.vision.common.InputImage
import com.google.mlkit.vision.face.Face
import com.google.mlkit.vision.face.FaceDetection
import com.google.mlkit.vision.face.FaceDetectorOptions
import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.PigeonApiFaceDetectorApi
import dev.hebei.camerax_android.ml.Detector

class FaceDetectorImpl(impl: CameraXImpl) : PigeonApiFaceDetectorApi(impl) {
    override fun pigeon_defaultConstructor(options: FaceDetectorOptions?): FaceDetector {
        val obj = if (options == null) FaceDetection.getClient()
        else FaceDetection.getClient(options)
        return FaceDetector(obj)
    }

    override fun process0(pigeon_instance: FaceDetector, image: MlImage, callback: (Result<List<Face>>) -> Unit) {
        pigeon_instance.process(image).addOnSuccessListener { value ->
            callback(Result.success(value))
        }.addOnFailureListener { exception ->
            callback(Result.failure(exception))
        }
    }

    override fun process1(pigeon_instance: FaceDetector, image: InputImage, callback: (Result<List<Face>>) -> Unit) {
        pigeon_instance.process(image).addOnSuccessListener { value ->
            callback(Result.success(value))
        }.addOnFailureListener { exception ->
            callback(Result.failure(exception))
        }
    }
}

class FaceDetector internal constructor(override val obj: com.google.mlkit.vision.face.FaceDetector) : Detector(obj) {
    fun process(image: MlImage): Task<List<Face>> {
        return obj.process(image)
    }

    fun process(image: InputImage): Task<List<Face>> {
        return obj.process(image)
    }
}