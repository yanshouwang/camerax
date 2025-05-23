package dev.hebei.camerax_android.ml

import androidx.camera.mlkit.vision.MlKitAnalyzer
import androidx.core.content.ContextCompat
import com.google.mlkit.vision.barcode.common.Barcode
import com.google.mlkit.vision.face.Face
import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.CoordinateSystemApi
import dev.hebei.camerax_android.PigeonApiMlKitAnalyzerApi
import dev.hebei.camerax_android.PigeonApiMlKitAnalyzerResultApi
import dev.hebei.camerax_android.common.MlKitAnalyzerResultConsumer
import dev.hebei.camerax_android.common.api
import dev.hebei.camerax_android.core.impl
import dev.hebei.camerax_android.ml.barcode.BarcodeScanner
import dev.hebei.camerax_android.ml.face.FaceDetector

class MlKitAnalyzerImpl(private val impl: CameraXImpl) : PigeonApiMlKitAnalyzerApi(impl) {
    override fun pigeon_defaultConstructor(
        detectors: List<Detector>, targetCoordinateSystem: CoordinateSystemApi, consumer: MlKitAnalyzerResultConsumer
    ): MlKitAnalyzer {
        val executor = ContextCompat.getMainExecutor(impl.context)
        return MlKitAnalyzer(detectors.map { it.obj }, targetCoordinateSystem.impl, executor, consumer)
    }

    class ResultImpl(impl: CameraXImpl) : PigeonApiMlKitAnalyzerResultApi(impl) {
        override fun timestamp(pigeon_instance: MlKitAnalyzer.Result): Long {
            return pigeon_instance.timestamp
        }

        override fun getThrowable(pigeon_instance: MlKitAnalyzer.Result, detector: Detector): List<Any?>? {
            return pigeon_instance.getThrowable(detector.obj)?.api
        }

        override fun getBarcodes(pigeon_instance: MlKitAnalyzer.Result, detector: BarcodeScanner): List<Barcode>? {
            return pigeon_instance.getValue(detector.obj)
        }

        override fun getFaces(pigeon_instance: MlKitAnalyzer.Result, detector: FaceDetector): List<Face>? {
            return pigeon_instance.getValue(detector.obj)
        }
    }
}