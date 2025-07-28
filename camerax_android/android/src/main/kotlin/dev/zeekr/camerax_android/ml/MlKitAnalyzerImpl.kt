package dev.zeekr.camerax_android.ml

import androidx.camera.mlkit.vision.MlKitAnalyzer
import androidx.core.content.ContextCompat
import com.google.mlkit.vision.barcode.common.Barcode
import com.google.mlkit.vision.face.Face
import dev.zeekr.camerax_android.CameraXImpl
import dev.zeekr.camerax_android.CoordinateSystemApi
import dev.zeekr.camerax_android.PigeonApiMlKitAnalyzerApi
import dev.zeekr.camerax_android.PigeonApiMlKitAnalyzerResultApi
import dev.zeekr.camerax_android.common.MlKitAnalyzerResultConsumer
import dev.zeekr.camerax_android.common.api
import dev.zeekr.camerax_android.core.impl
import dev.zeekr.camerax_android.ml.barcode.BarcodeScanner
import dev.zeekr.camerax_android.ml.face.FaceDetector

class MlKitAnalyzerImpl(private val impl: CameraXImpl) : PigeonApiMlKitAnalyzerApi(impl) {
    override fun pigeon_defaultConstructor(
        detectors: List<Detector>, targetCoordinateSystem: CoordinateSystemApi, consumer: MlKitAnalyzerResultConsumer
    ): MlKitAnalyzer {
        val executor = ContextCompat.getMainExecutor(impl.context)
        return MlKitAnalyzer(detectors.map { it.instance }, targetCoordinateSystem.impl, executor, consumer)
    }

    class ResultImpl(impl: CameraXImpl) : PigeonApiMlKitAnalyzerResultApi(impl) {
        override fun timestamp(pigeon_instance: MlKitAnalyzer.Result): Long {
            return pigeon_instance.timestamp
        }

        override fun getBarcodes(pigeon_instance: MlKitAnalyzer.Result, detector: BarcodeScanner): List<Barcode>? {
            return pigeon_instance.getValue(detector.instance)
        }

        override fun getFaces(pigeon_instance: MlKitAnalyzer.Result, detector: FaceDetector): List<Face>? {
            return pigeon_instance.getValue(detector.instance)
        }

        override fun getThrowable(pigeon_instance: MlKitAnalyzer.Result, detector: Detector): List<Any?>? {
            return pigeon_instance.getThrowable(detector.instance)?.api
        }
    }
}