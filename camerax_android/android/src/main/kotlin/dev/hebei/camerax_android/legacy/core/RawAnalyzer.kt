package dev.hebei.camerax_android.legacy.core

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiRawAnalyzer

class RawAnalyzer(registrar: CameraXRegistrar) : PigeonApiRawAnalyzer(registrar) {
    override fun pigeon_defaultConstructor(): androidx.camera.core.ImageAnalysis.Analyzer {
        return Impl(this)
    }

    class Impl(private val api: RawAnalyzer) : androidx.camera.core.ImageAnalysis.Analyzer {
        override fun analyze(image: androidx.camera.core.ImageProxy) {
            api.analyze(this, image) {}
        }
    }
}