package dev.hebei.camerax_android.ml

import androidx.core.content.ContextCompat
import dev.hebei.camerax_android.CameraXRegistrar
import dev.hebei.camerax_android.CoordinateSystemApi
import dev.hebei.camerax_android.PigeonApiMlKitAnalyzerApi
import dev.hebei.camerax_android.PigeonApiMlKitAnalyzerResultApi
import dev.hebei.camerax_android.common.MlKitAnalyzerResultConsumer
import dev.hebei.camerax_android.common.api
import dev.hebei.camerax_android.core.impl
import dev.hebei.camerax_android.ml.barcode.BarcodeScanner
import dev.hebei.camerax_android.ml.face.FaceDetector

class MlKitAnalyzerImpl(private val registrar: CameraXRegistrar) : PigeonApiMlKitAnalyzerApi(registrar) {
    override fun pigeon_defaultConstructor(
        detectors: List<Detector>, targetCoordinateSystem: CoordinateSystemApi, consumer: MlKitAnalyzerResultConsumer
    ): androidx.camera.mlkit.vision.MlKitAnalyzer {
        val executor = ContextCompat.getMainExecutor(registrar.context)
        return androidx.camera.mlkit.vision.MlKitAnalyzer(
            detectors.map { it.obj }, targetCoordinateSystem.impl, executor, consumer
        )
    }

    class ResultImpl(registrar: CameraXRegistrar) : PigeonApiMlKitAnalyzerResultApi(registrar) {
        override fun timestamp(pigeon_instance: androidx.camera.mlkit.vision.MlKitAnalyzer.Result): Long {
            return pigeon_instance.timestamp
        }

        override fun getThrowable(
            pigeon_instance: androidx.camera.mlkit.vision.MlKitAnalyzer.Result, detector: Detector
        ): List<Any?>? {
            return pigeon_instance.getThrowable(detector.obj)?.api
        }

        override fun getBarcodes(
            pigeon_instance: androidx.camera.mlkit.vision.MlKitAnalyzer.Result, detector: BarcodeScanner
        ): List<com.google.mlkit.vision.barcode.common.Barcode>? {
            return pigeon_instance.getValue(detector.obj)
        }

        override fun getFaces(
            pigeon_instance: androidx.camera.mlkit.vision.MlKitAnalyzer.Result, detector: FaceDetector
        ): List<com.google.mlkit.vision.face.Face>? {
            return pigeon_instance.getValue(detector.obj)
        }
    }
}