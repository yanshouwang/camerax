package dev.zeekr.camerax_android.ml.barcode

import com.google.mlkit.vision.barcode.BarcodeScanner
import com.google.mlkit.vision.barcode.BarcodeScannerOptions
import com.google.mlkit.vision.barcode.BarcodeScanning
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiBarcodeScannerProxyApi

class BarcodeScannerImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiBarcodeScannerProxyApi(registrar) {
    override fun pigeon_defaultConstructor(): BarcodeScanner {
        return BarcodeScanning.getClient()
    }

    override fun options(options: BarcodeScannerOptions): BarcodeScanner {
        return BarcodeScanning.getClient(options)
    }
}