package dev.zeekr.camerax_android.ml.common

import com.google.mlkit.vision.common.InputImage
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiInputImageProxyApi
import dev.zeekr.camerax_android.common.uriImpl
import dev.zeekr.camerax_android.context

class InputImageImpl(private val registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiInputImageProxyApi(registrar) {
    override fun fromFilePath(imageUri: String): InputImage {
        return InputImage.fromFilePath(registrar.context, imageUri.uriImpl)
    }

    override fun getWidth(pigeon_instance: InputImage): Long {
        return pigeon_instance.width.toLong()
    }

    override fun getHeight(pigeon_instance: InputImage): Long {
        return pigeon_instance.height.toLong()
    }
}