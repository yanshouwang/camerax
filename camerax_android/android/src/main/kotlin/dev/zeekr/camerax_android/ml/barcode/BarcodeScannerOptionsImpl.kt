package dev.zeekr.camerax_android.ml.barcode

import com.google.mlkit.vision.barcode.BarcodeScannerOptions
import com.google.mlkit.vision.barcode.ZoomSuggestionOptions
import dev.zeekr.camerax_android.BarcodeFormatApi
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiBarcodeScannerOptionsBuilderProxyApi
import dev.zeekr.camerax_android.PigeonApiBarcodeScannerOptionsProxyApi

class BarcodeScannerOptionsImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiBarcodeScannerOptionsProxyApi(registrar) {
    class BuilderImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
        PigeonApiBarcodeScannerOptionsBuilderProxyApi(registrar) {
        override fun pigeon_defaultConstructor(): BarcodeScannerOptions.Builder {
            return BarcodeScannerOptions.Builder()
        }

        override fun enableAllPotentialBarcodes(pigeon_instance: BarcodeScannerOptions.Builder): BarcodeScannerOptions.Builder {
            return pigeon_instance.enableAllPotentialBarcodes()
        }

        override fun setBarcodeFormats(
            pigeon_instance: BarcodeScannerOptions.Builder, formats: List<Long>
        ): BarcodeScannerOptions.Builder {
            val format = formats.first().toInt()
            val moreFormats = formats.drop(1).map { it.toInt() }.toIntArray()
            return pigeon_instance.setBarcodeFormats(format, *moreFormats)
        }

        override fun setZoomSuggestionOptions(
            pigeon_instance: BarcodeScannerOptions.Builder, zoomSuggestionOptions: ZoomSuggestionOptions
        ): BarcodeScannerOptions.Builder {
            return pigeon_instance.setZoomSuggestionOptions(zoomSuggestionOptions)
        }

        override fun build(pigeon_instance: BarcodeScannerOptions.Builder): BarcodeScannerOptions {
            return pigeon_instance.build()
        }
    }

    override fun build(
        enableAllPotentialBarcodes: Boolean?, formats: List<Long>?, zoomSuggestionOptions: ZoomSuggestionOptions?
    ): BarcodeScannerOptions {
        val builder = BarcodeScannerOptions.Builder()
        if (enableAllPotentialBarcodes == true) {
            builder.enableAllPotentialBarcodes()
        }
        if (!formats.isNullOrEmpty()) {
            val format = formats.first().toInt()
            val moreFormats = formats.drop(1).map { it.toInt() }.toIntArray()
            builder.setBarcodeFormats(format, *moreFormats)
        }
        if (zoomSuggestionOptions != null) {
            builder.setZoomSuggestionOptions(zoomSuggestionOptions)
        }
        return builder.build()
    }
}