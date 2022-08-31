package dev.yanshouwang.camerax

import androidx.camera.core.ImageAnalysis
import dev.yanshouwang.camerax.models.proto.imageProxy
import io.flutter.plugin.common.BinaryMessenger

class ImageAnalyzerPigeon : Pigeons.ImageAnalyzerHostPigeon {
    lateinit var binaryMessenger: BinaryMessenger

    private val flutter by lazy { Pigeons.ImageAnalyzerFutterPigeon(binaryMessenger) }

    override fun create(id: String) {
        val analyzer = ImageAnalysis.Analyzer {
            InstanceManager.add(it.id, it)
            val imageProxyBuffer = imageProxy {
                this.id = it.id
            }.toByteArray()
            flutter.onAnalyzed(id, imageProxyBuffer) {}
        }
        InstanceManager.add(id, analyzer)
    }
}