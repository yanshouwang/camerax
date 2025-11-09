package dev.zeekr.camerax_android.ml

import androidx.camera.mlkit.vision.MlKitAnalyzer
import androidx.core.content.ContextCompat
import com.google.mlkit.vision.barcode.BarcodeScanner
import com.google.mlkit.vision.barcode.common.Barcode
import com.google.mlkit.vision.face.Face
import com.google.mlkit.vision.face.FaceDetector
import dev.zeekr.camerax_android.*
import dev.zeekr.camerax_android.common.MlKitAnalyzerResultConsumer
import dev.zeekr.camerax_android.common.api
import dev.zeekr.camerax_android.core.impl

class MlKitAnalyzerImpl(private val registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiMlKitAnalyzerProxyApi(registrar) {
    override fun pigeon_defaultConstructor(
        detectors1: List<BarcodeScanner>,
        detectors2: List<FaceDetector>,
        targetCoordinateSystem: ImageAnalysisCoordinateSystemApi,
        consumer: MlKitAnalyzerResultConsumer
    ): MlKitAnalyzer {
        val executor = ContextCompat.getMainExecutor(registrar.context)
        return MlKitAnalyzer(detectors1 + detectors2, targetCoordinateSystem.impl, executor, consumer)
    }

    class ResultImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiMlKitAnalyzerResultProxyApi(registrar) {
        override fun timestamp(pigeon_instance: MlKitAnalyzer.Result): Long {
            return pigeon_instance.timestamp
        }

        override fun getValue1(pigeon_instance: MlKitAnalyzer.Result, detector: BarcodeScanner): List<Barcode>? {
            return pigeon_instance.getValue(detector)
        }

        override fun getValue2(pigeon_instance: MlKitAnalyzer.Result, detector: FaceDetector): List<Face>? {
            return pigeon_instance.getValue(detector)
        }

        override fun getThrowable1(pigeon_instance: MlKitAnalyzer.Result, detector: BarcodeScanner): List<Any?>? {
            return pigeon_instance.getThrowable(detector)?.api
        }

        override fun getThrowable2(pigeon_instance: MlKitAnalyzer.Result, detector: FaceDetector): List<Any?>? {
            return pigeon_instance.getThrowable(detector)?.api
        }
    }
}