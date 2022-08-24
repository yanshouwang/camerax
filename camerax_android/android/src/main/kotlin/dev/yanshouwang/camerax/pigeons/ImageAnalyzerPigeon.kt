package dev.yanshouwang.camerax.pigeons

import dev.yanshouwang.camerax.InstanceManager
import dev.yanshouwang.camerax.id
import dev.yanshouwang.camerax.messages.imageProxy
import io.flutter.plugin.common.BinaryMessenger
import androidx.camera.core.ImageAnalysis

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