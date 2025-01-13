package dev.hebei.camerax_android.legacy.core

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiImageAnalyzer

class ImageAnalyzer(registrar: CameraXRegistrar) : PigeonApiImageAnalyzer(registrar) {
    override fun pigeon_defaultConstructor(): androidx.camera.core.ImageAnalysis.Analyzer {
        return Impl(this)
    }

    class Impl(private val api: ImageAnalyzer) : androidx.camera.core.ImageAnalysis.Analyzer {
        override fun analyze(image: androidx.camera.core.ImageProxy) {
            api.analyze(this, image) {}
        }
    }
}