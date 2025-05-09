package dev.hebei.camerax_android.core

import dev.hebei.camerax_android.CameraXRegistrar
import dev.hebei.camerax_android.PigeonApiImageAnalyzerApi

class ImageAnalyzerImpl(registrar: CameraXRegistrar) : PigeonApiImageAnalyzerApi(registrar) {
    override fun pigeon_defaultConstructor(): androidx.camera.core.ImageAnalysis.Analyzer {
        return Impl(this)
    }

    class Impl(private val api: ImageAnalyzerImpl) : androidx.camera.core.ImageAnalysis.Analyzer {
        override fun analyze(image: androidx.camera.core.ImageProxy) {
            api.analyze(this, image) {}
        }
    }
}