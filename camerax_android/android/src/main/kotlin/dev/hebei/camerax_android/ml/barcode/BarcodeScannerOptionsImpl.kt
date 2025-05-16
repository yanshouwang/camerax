package dev.hebei.camerax_android.ml.barcode

import dev.hebei.camerax_android.BarcodeFormatApi
import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.PigeonApiBarcodeScannerOptionsApi

class BarcodeScannerOptionsImpl(impl: CameraXImpl) : PigeonApiBarcodeScannerOptionsApi(impl) {
    override fun build(
        enableAllPotentialBarcodes: Boolean?,
        formats: List<BarcodeFormatApi>?,
        zoomSuggestionOptions: com.google.mlkit.vision.barcode.ZoomSuggestionOptions?
    ): com.google.mlkit.vision.barcode.BarcodeScannerOptions {
        val builder = com.google.mlkit.vision.barcode.BarcodeScannerOptions.Builder()
        if (enableAllPotentialBarcodes == true) {
            builder.enableAllPotentialBarcodes()
        }
        if (!formats.isNullOrEmpty()) {
            val format = formats.first().impl
            val moreFormats = formats.drop(1).map { it.impl }.toIntArray()
            builder.setBarcodeFormats(format, *moreFormats)
        }
        if (zoomSuggestionOptions != null) {
            builder.setZoomSuggestionOptions(zoomSuggestionOptions)
        }
        return builder.build()
    }
}