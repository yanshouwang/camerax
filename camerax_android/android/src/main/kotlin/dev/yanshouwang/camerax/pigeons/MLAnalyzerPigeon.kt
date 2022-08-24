package dev.yanshouwang.camerax.pigeons

import android.content.Context
import android.graphics.Matrix
import android.util.Size
import androidx.camera.core.ImageAnalysis
import androidx.camera.core.ImageProxy
import androidx.camera.mlkit.vision.MlKitAnalyzer
import androidx.camera.view.CameraController
import androidx.core.content.ContextCompat
import androidx.core.util.Consumer
import com.google.mlkit.vision.barcode.BarcodeScanning
import com.google.mlkit.vision.barcode.common.Barcode
import dev.yanshouwang.camerax.InstanceManager
import dev.yanshouwang.camerax.messages.*
import io.flutter.plugin.common.BinaryMessenger
import java.util.concurrent.Executor

internal class MLAnalyzerPigeon() : Pigeons.MLAnalyzerHostPigeon {
    lateinit var context: Context
    lateinit var binaryMessenger: BinaryMessenger

    private val flutter by lazy { Pigeons.MLAnalyzerFlutterPigeon(binaryMessenger) }

    override fun create(id: String) {
        val executor = ContextCompat.getMainExecutor(context)
        val barcodeScanner = BarcodeScanning.getClient()
        val detectors = listOf(barcodeScanner)
        val analyzer = MlKitAnalyzer(detectors, CameraController.COORDINATE_SYSTEM_VIEW_REFERENCED, executor) {
            val barcodes = it.getValue(barcodeScanner)
            if (barcodes.isNullOrEmpty()) {
                return@MlKitAnalyzer
            }
            val recognitionBuffer = mLRecognition {
                val objs = barcodes.map {
                    mLObject {
                        val myBoundingBox = it.boundingBox
                        val myRawValue = it.rawValue
                        if (myBoundingBox != null) {
                            val topLeft = offset {
                                this.dx = myBoundingBox.left
                                this.dy = myBoundingBox.top
                            }
                            val topRight = offset {
                                this.dx = myBoundingBox.right
                                this.dy = myBoundingBox.top
                            }
                            val bottomLeft = offset {
                                this.dx = myBoundingBox.left
                                this.dy = myBoundingBox.bottom
                            }
                            val bottomRight = offset {
                                this.dx = myBoundingBox.right
                                this.dy = myBoundingBox.bottom
                            }
                            val corners = listOf(topLeft, topRight, bottomLeft, bottomRight)
                            this.corners.addAll(corners)
                        }
                        if (myRawValue != null) {
                            this.barcode = barcode {
                                this.value = myRawValue
                            }
                        }
                    }
                }
                this.objs.addAll(objs)
            }.toByteArray()
            flutter.onAnalyzed(id, recognitionBuffer) {}
        }
        InstanceManager.add(id, analyzer)
    }

    override fun analyze(id: String, imageProxyId: String) {
        val analyzer = InstanceManager.findInstance<MlKitAnalyzer>(id) ?: throw IllegalArgumentException()
        val imageProxy = InstanceManager.findInstance<ImageProxy>(imageProxyId) ?: throw IllegalArgumentException()
        analyzer.analyze(imageProxy)
    }
}
