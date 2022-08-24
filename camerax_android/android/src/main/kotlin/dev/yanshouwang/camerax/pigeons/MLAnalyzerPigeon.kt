package dev.yanshouwang.camerax.pigeons

import android.content.Context
import android.graphics.Matrix
import android.util.Size
import androidx.camera.core.ImageAnalysis
import androidx.camera.core.ImageProxy
import androidx.camera.mlkit.vision.MlKitAnalyzer
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
        val analyzer = MLAnalyzer(executor) {
            val recognitionBuffer = mLRecognition {
                this.size = size {
                    this.width = it.size.width
                    this.height = it.size.height
                }
                val objs = it.barcodes.map {
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
        val analyzer = InstanceManager.findInstance<MLAnalyzer>(id) ?: throw IllegalArgumentException()
        val imageProxy = InstanceManager.findInstance<ImageProxy>(imageProxyId) ?: throw IllegalArgumentException()
        analyzer.analyze(imageProxy)
    }
}

class MLAnalyzer(executor: Executor, consumer: Consumer<MLRecognition>) : ImageAnalysis.Analyzer {
    private val barcodeScanner = BarcodeScanning.getClient()
    private val detectors get() = listOf(barcodeScanner)
    private val analyzer = MlKitAnalyzer(detectors, ImageAnalysis.COORDINATE_SYSTEM_ORIGINAL, executor) {
        val barcodes = it.getValue(barcodeScanner)
        if (barcodes.isNullOrEmpty()) {
            return@MlKitAnalyzer
        }
        val recognition = MLRecognition(size, barcodes)
        consumer.accept(recognition)
    }

    lateinit var size: Size

    override fun analyze(image: ImageProxy) {
        size = Size(image.width, image.height)
        analyzer.analyze(image)
    }

    override fun getDefaultTargetResolution(): Size {
        return analyzer.defaultTargetResolution
    }

    override fun getTargetCoordinateSystem(): Int {
        return analyzer.targetCoordinateSystem
    }

    override fun updateTransform(matrix: Matrix?) {
        return analyzer.updateTransform(matrix)
    }
}

data class MLRecognition(val size: Size, val barcodes: List<Barcode>)