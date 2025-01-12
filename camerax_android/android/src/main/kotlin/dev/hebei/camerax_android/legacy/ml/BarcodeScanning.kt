package dev.hebei.camerax_android.legacy.ml

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiBarcodeScanning

class BarcodeScanning(registrar: CameraXRegistrar) : PigeonApiBarcodeScanning(registrar) {
    override fun getClient(options: com.google.mlkit.vision.barcode.BarcodeScannerOptions?): BarcodeScanner.Stub {
        val obj = if (options == null) com.google.mlkit.vision.barcode.BarcodeScanning.getClient()
        else com.google.mlkit.vision.barcode.BarcodeScanning.getClient(options)
        return BarcodeScanner.Stub(obj)
    }
}