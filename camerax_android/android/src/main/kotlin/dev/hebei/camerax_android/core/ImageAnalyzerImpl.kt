package dev.hebei.camerax_android.core

import androidx.camera.core.ImageAnalysis
import androidx.camera.core.ImageProxy
import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.PigeonApiImageAnalyzerApi

class ImageAnalyzerImpl(impl: CameraXImpl) : PigeonApiImageAnalyzerApi(impl) {
    override fun pigeon_defaultConstructor(): ImageAnalysis.Analyzer {
        return Impl(this)
    }

    class Impl(private val api: ImageAnalyzerImpl) : ImageAnalysis.Analyzer {
        override fun analyze(image: ImageProxy) {
            api.analyze(this, image) {}
        }
    }
}