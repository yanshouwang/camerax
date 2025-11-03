package dev.zeekr.camerax_android.ml.barcode

import com.google.mlkit.vision.barcode.BarcodeScanner
import com.google.mlkit.vision.barcode.BarcodeScannerOptions
import com.google.mlkit.vision.barcode.BarcodeScanning
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiBarcodeScanningApi

class BarcodeScanningImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiBarcodeScanningApi(registrar) {
    override fun getClient1(): BarcodeScanner {
        return BarcodeScanning.getClient()
    }

    override fun getClient2(options: BarcodeScannerOptions): BarcodeScanner {
        return BarcodeScanning.getClient(options)
    }
}