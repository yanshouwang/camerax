package dev.yanshouwang.camerax.pigeons

import dev.yanshouwang.camerax.InstanceManager
import io.flutter.plugin.common.BinaryMessenger
import androidx.camera.core.ImageAnalysis as MyImageAnalysis

class ImageAnalyzerPigeon : Pigeons.ImageAnalyzerHostPigeon {
    lateinit var binaryMessenger: BinaryMessenger

    private val flutter by lazy { Pigeons.ImageAnalyzerFutterPigeon(binaryMessenger) }

    override fun create(id: String) {
        val myAnalyzer = MyImageAnalysis.Analyzer { imageProxy ->
            TODO("Not yet implemented")
        }
        InstanceManager.add(id, myAnalyzer)
    }
}