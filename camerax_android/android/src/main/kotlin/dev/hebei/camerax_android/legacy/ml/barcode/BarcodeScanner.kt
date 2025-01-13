package dev.hebei.camerax_android.legacy.ml.barcode

import com.google.android.gms.tasks.Task
import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiBarcodeScanner
import dev.hebei.camerax_android.legacy.ml.Detector

class BarcodeScanner(registrar: CameraXRegistrar) : PigeonApiBarcodeScanner(registrar) {
    override fun pigeon_defaultConstructor(options: com.google.mlkit.vision.barcode.BarcodeScannerOptions?): Stub {
        val obj = if (options == null) com.google.mlkit.vision.barcode.BarcodeScanning.getClient()
        else com.google.mlkit.vision.barcode.BarcodeScanning.getClient(options)
        return Stub(obj)
    }

    override fun process0(
        pigeon_instance: Stub,
        image: com.google.android.odml.image.MlImage,
        callback: (Result<List<com.google.mlkit.vision.barcode.common.Barcode>>) -> Unit
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
        callback: (Result<List<com.google.mlkit.vision.barcode.common.Barcode>>) -> Unit
    ) {
        pigeon_instance.process(image).addOnSuccessListener { value ->
            callback(Result.success(value))
        }.addOnFailureListener { exception ->
            callback(Result.failure(exception))
        }
    }

    class Stub internal constructor(override val obj: com.google.mlkit.vision.barcode.BarcodeScanner) :
        Detector.Stub(obj) {
        fun process(image: com.google.android.odml.image.MlImage): Task<List<com.google.mlkit.vision.barcode.common.Barcode>> {
            return obj.process(image)
        }

        fun process(image: com.google.mlkit.vision.common.InputImage): Task<List<com.google.mlkit.vision.barcode.common.Barcode>> {
            return obj.process(image)
        }
    }
}