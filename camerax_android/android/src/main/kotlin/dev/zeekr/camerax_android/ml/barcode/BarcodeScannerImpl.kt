package dev.zeekr.camerax_android.ml.barcode

import com.google.android.odml.image.MlImage
import com.google.mlkit.vision.barcode.BarcodeScannerOptions
import com.google.mlkit.vision.barcode.BarcodeScanning
import com.google.mlkit.vision.barcode.common.Barcode
import com.google.mlkit.vision.common.InputImage
import dev.zeekr.camerax_android.CameraXImpl
import dev.zeekr.camerax_android.PigeonApiBarcodeScannerApi
import dev.zeekr.camerax_android.ml.Detector

class BarcodeScannerImpl(impl: CameraXImpl) : PigeonApiBarcodeScannerApi(impl) {
    override fun pigeon_defaultConstructor(options: BarcodeScannerOptions?): BarcodeScanner {
        val instance = if (options == null) BarcodeScanning.getClient()
        else BarcodeScanning.getClient(options)
        return BarcodeScanner(instance)
    }
}

class BarcodeScanner internal constructor(override val instance: com.google.mlkit.vision.barcode.BarcodeScanner) :
    Detector(instance)