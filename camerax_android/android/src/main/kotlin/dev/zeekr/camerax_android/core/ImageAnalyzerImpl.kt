package dev.zeekr.camerax_android.core

import androidx.camera.core.ImageAnalysis
import androidx.camera.core.ImageProxy
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiImageAnalyzerApi

class ImageAnalyzerImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiImageAnalyzerApi(registrar) {
    override fun pigeon_defaultConstructor(): ImageAnalysis.Analyzer {
        return object : ImageAnalysis.Analyzer {
            override fun analyze(image: ImageProxy) {
                analyze(this, image) {}
            }
        }
    }
}