package dev.zeekr.camerax_android.ml.barcode

import com.google.mlkit.vision.barcode.BarcodeScannerOptions
import com.google.mlkit.vision.barcode.BarcodeScanning
import dev.zeekr.camerax_android.CameraXRegistrarImpl
import dev.zeekr.camerax_android.PigeonApiBarcodeScannerApi
import dev.zeekr.camerax_android.ml.Detector

class BarcodeScannerImpl(impl: CameraXRegistrarImpl) : PigeonApiBarcodeScannerApi(impl) {
    override fun pigeon_defaultConstructor(options: BarcodeScannerOptions?): BarcodeScanner {
        val instance = if (options == null) BarcodeScanning.getClient()
        else BarcodeScanning.getClient(options)
        return BarcodeScanner(instance)
    }
}

class BarcodeScanner internal constructor(override val instance: com.google.mlkit.vision.barcode.BarcodeScanner) :
    Detector(instance)