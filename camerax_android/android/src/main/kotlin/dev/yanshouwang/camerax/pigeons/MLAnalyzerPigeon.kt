package dev.yanshouwang.camerax.pigeons

import androidx.core.util.Consumer
import com.google.protobuf.ByteString
import androidx.camera.core.ImageAnalysis as MyImageAnalysis
import androidx.camera.mlkit.vision.MlKitAnalyzer as MyMlKitAnalyzer
import com.google.mlkit.vision.barcode.BarcodeScanning as MyBarcodeScanning
import dev.yanshouwang.camerax.InstanceManager
import dev.yanshouwang.camerax.messages.barcode
import dev.yanshouwang.camerax.messages.mLMetadataObject
import dev.yanshouwang.camerax.messages.rect
import io.flutter.plugin.common.BinaryMessenger
import java.util.concurrent.Executor

internal class MLAnalyzerPigeon(private val executor: Executor) : Pigeons.MLAnalyzerHostPigeon {
    lateinit var binaryMessenger: BinaryMessenger

    private val flutter by lazy { Pigeons.MLAnalyzerFlutterPigeon(binaryMessenger) }

    override fun create(id: String) {
        val barcodeScanner = MyBarcodeScanning.getClient()
        val myDetectors = listOf(barcodeScanner)
        val consumer = Consumer<MyMlKitAnalyzer.Result> { result ->
            val mlMetadataObjectBuffer = mLMetadataObject {
                val barcodes = result.getValue(barcodeScanner)?.map { item ->
                    barcode {
                        val boundingBox = item.boundingBox
                        val rawValue = item.rawValue
                        val rawBytes = item.rawBytes
                        if (boundingBox != null) {
                            this.boundingBox = rect {
                                this.left = boundingBox.left
                                this.top = boundingBox.top
                                this.right = boundingBox.right
                                this.bottom = boundingBox.bottom
                            }
                        }
                        if (rawValue != null) {
                            this.rawValue = rawValue
                        }
                        if (rawBytes != null) {
                            this.rawBytes = ByteString.copyFrom(rawBytes)
                        }
                    }
                }?.toList() ?: listOf()
                this.barcodes.addAll(barcodes)
            }.toByteArray()
            flutter.onAnalyzed(id, mlMetadataObjectBuffer) {}
        }
        val analyzer = MyMlKitAnalyzer(
            myDetectors,
            MyImageAnalysis.COORDINATE_SYSTEM_ORIGINAL,
            executor,
            consumer
        )
        InstanceManager.add(id, analyzer)
    }
}