package dev.hebei.camerax_android.legacy.ml

import androidx.core.content.ContextCompat
import dev.hebei.camerax_android.legacy.*
import dev.hebei.camerax_android.legacy.common.MlKitAnalyzerResultConsumer
import dev.hebei.camerax_android.legacy.common.args
import dev.hebei.camerax_android.legacy.core.obj
import dev.hebei.camerax_android.legacy.ml.barcode.BarcodeScanner
import dev.hebei.camerax_android.legacy.ml.face.FaceDetector

class MlKitAnalyzer(private val registrar: CameraXRegistrar) : PigeonApiMlKitAnalyzer(registrar) {
    override fun pigeon_defaultConstructor(
        detectors: List<Detector.Stub>,
        targetCoordinateSystem: CoordinateSystem,
        consumer: MlKitAnalyzerResultConsumer.Impl
    ): androidx.camera.mlkit.vision.MlKitAnalyzer {
        val executor = ContextCompat.getMainExecutor(registrar.context)
        return androidx.camera.mlkit.vision.MlKitAnalyzer(
            detectors.map { it.obj }, targetCoordinateSystem.obj, executor, consumer
        )
    }

    override fun analyze(
        pigeon_instance: androidx.camera.mlkit.vision.MlKitAnalyzer, image: androidx.camera.core.ImageProxy
    ) {
        pigeon_instance.analyze(image)
    }

    class Result(registrar: CameraXRegistrar) : PigeonApiMlKitAnalyzerResult(registrar) {
        override fun timestamp(pigeon_instance: androidx.camera.mlkit.vision.MlKitAnalyzer.Result): Long {
            return pigeon_instance.timestamp
        }

        override fun getThrowable(
            pigeon_instance: androidx.camera.mlkit.vision.MlKitAnalyzer.Result, detector: Detector.Stub
        ): List<Any?>? {
            return pigeon_instance.getThrowable(detector.obj)?.args
        }

        override fun getBarcodes(
            pigeon_instance: androidx.camera.mlkit.vision.MlKitAnalyzer.Result, detector: BarcodeScanner.Stub
        ): List<com.google.mlkit.vision.barcode.common.Barcode>? {
            return pigeon_instance.getValue(detector.obj)
        }

        override fun getFaces(
            pigeon_instance: androidx.camera.mlkit.vision.MlKitAnalyzer.Result, detector: FaceDetector.Stub
        ): List<com.google.mlkit.vision.face.Face>? {
            return pigeon_instance.getValue(detector.obj)
        }
    }
}