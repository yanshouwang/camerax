package dev.zeekr.camerax_android.ml.barcode

import com.google.mlkit.vision.barcode.BarcodeScannerOptions
import com.google.mlkit.vision.barcode.ZoomSuggestionOptions
import dev.zeekr.camerax_android.BarcodeFormatApi
import dev.zeekr.camerax_android.CameraXImpl
import dev.zeekr.camerax_android.PigeonApiBarcodeScannerOptionsApi

class BarcodeScannerOptionsImpl(impl: CameraXImpl) : PigeonApiBarcodeScannerOptionsApi(impl) {
    override fun build(
        enableAllPotentialBarcodes: Boolean?,
        formats: List<BarcodeFormatApi>?,
        zoomSuggestionOptions: ZoomSuggestionOptions?
    ): BarcodeScannerOptions {
        val builder = BarcodeScannerOptions.Builder()
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