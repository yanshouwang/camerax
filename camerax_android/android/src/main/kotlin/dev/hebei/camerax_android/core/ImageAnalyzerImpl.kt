package dev.hebei.camerax_android.core

import androidx.camera.core.ImageAnalysis
import androidx.camera.core.ImageProxy
import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.PigeonApiImageAnalyzerApi

class ImageAnalyzerImpl(impl: CameraXImpl) : PigeonApiImageAnalyzerApi(impl) {
    override fun pigeon_defaultConstructor(): ImageAnalysis.Analyzer {
        return object : ImageAnalysis.Analyzer {
            override fun analyze(image: ImageProxy) {
                analyze(this, image) {}
            }
        }
    }
}