package dev.hebei.camerax_android.ml.barcode

import com.google.android.gms.tasks.Task
import com.google.android.odml.image.MlImage
import com.google.mlkit.vision.barcode.BarcodeScannerOptions
import com.google.mlkit.vision.barcode.BarcodeScanning
import com.google.mlkit.vision.barcode.common.Barcode
import com.google.mlkit.vision.common.InputImage
import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.PigeonApiBarcodeScannerApi
import dev.hebei.camerax_android.ml.Detector

class BarcodeScannerImpl(impl: CameraXImpl) : PigeonApiBarcodeScannerApi(impl) {
    override fun pigeon_defaultConstructor(options: BarcodeScannerOptions?): BarcodeScanner {
        val obj = if (options == null) BarcodeScanning.getClient()
        else BarcodeScanning.getClient(options)
        return BarcodeScanner(obj)
    }

    override fun process0(pigeon_instance: BarcodeScanner, image: MlImage, callback: (Result<List<Barcode>>) -> Unit) {
        pigeon_instance.process(image).addOnSuccessListener { value ->
            callback(Result.success(value))
        }.addOnFailureListener { exception ->
            callback(Result.failure(exception))
        }
    }

    override fun process1(
        pigeon_instance: BarcodeScanner, image: InputImage, callback: (Result<List<Barcode>>) -> Unit
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
    fun process(image: MlImage): Task<List<Barcode>> {
        return obj.process(image)
    }

    fun process(image: InputImage): Task<List<Barcode>> {
        return obj.process(image)
    }
}