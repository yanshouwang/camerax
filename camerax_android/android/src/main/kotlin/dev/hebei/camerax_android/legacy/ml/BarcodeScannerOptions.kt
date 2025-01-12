package dev.hebei.camerax_android.legacy.ml

import dev.hebei.camerax_android.legacy.BarcodeFormat
import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiBarcodeScannerOptions

class BarcodeScannerOptions(registrar: CameraXRegistrar) : PigeonApiBarcodeScannerOptions(registrar) {
    override fun build(
        enableAllPotentialBarcodes: Boolean?,
        formats: List<BarcodeFormat>?,
        zoomSuggestionOptions: com.google.mlkit.vision.barcode.ZoomSuggestionOptions?
    ): com.google.mlkit.vision.barcode.BarcodeScannerOptions {
        val builder = com.google.mlkit.vision.barcode.BarcodeScannerOptions.Builder()
        if (enableAllPotentialBarcodes == true) {
            builder.enableAllPotentialBarcodes()
        }
        if (!formats.isNullOrEmpty()) {
            val format = formats.first().obj
            val moreFormats = formats.drop(1).map { it.obj }.toIntArray()
            builder.setBarcodeFormats(format, *moreFormats)
        }
        if (zoomSuggestionOptions != null) {
            builder.setZoomSuggestionOptions(zoomSuggestionOptions)
        }
        return builder.build()
    }
}