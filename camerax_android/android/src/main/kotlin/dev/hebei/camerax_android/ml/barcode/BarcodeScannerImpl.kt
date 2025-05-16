package dev.hebei.camerax_android.ml.barcode

import com.google.android.gms.tasks.Task
import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.PigeonApiBarcodeScannerApi
import dev.hebei.camerax_android.ml.Detector

class BarcodeScannerImpl(impl: CameraXImpl) : PigeonApiBarcodeScannerApi(impl) {
    override fun pigeon_defaultConstructor(options: com.google.mlkit.vision.barcode.BarcodeScannerOptions?): BarcodeScanner {
        val obj = if (options == null) com.google.mlkit.vision.barcode.BarcodeScanning.getClient()
        else com.google.mlkit.vision.barcode.BarcodeScanning.getClient(options)
        return BarcodeScanner(obj)
    }

    override fun process0(
        pigeon_instance: BarcodeScanner,
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
        pigeon_instance: BarcodeScanner,
        image: com.google.mlkit.vision.common.InputImage,
        callback: (Result<List<com.google.mlkit.vision.barcode.common.Barcode>>) -> Unit
    ) {
        pigeon_instance.process(image).addOnSuccessListener { value ->
            callback(Result.success(value))
        }.addOnFailureListener { exception ->
            callback(Result.failure(exception))
        }
    }
}


class BarcodeScanner internal constructor(override val obj: com.google.mlkit.vision.barcode.BarcodeScanner) :
    Detector(obj) {
    fun process(image: com.google.android.odml.image.MlImage): Task<List<com.google.mlkit.vision.barcode.common.Barcode>> {
        return obj.process(image)
    }

    fun process(image: com.google.mlkit.vision.common.InputImage): Task<List<com.google.mlkit.vision.barcode.common.Barcode>> {
        return obj.process(image)
    }
}