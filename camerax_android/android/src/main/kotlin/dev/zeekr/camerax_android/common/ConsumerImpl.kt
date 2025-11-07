package dev.zeekr.camerax_android.common

import androidx.camera.core.ImageProxy
import androidx.camera.mlkit.vision.MlKitAnalyzer
import androidx.camera.video.VideoRecordEvent
import androidx.core.util.Consumer
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiImageProxyConsumerProxyApi
import dev.zeekr.camerax_android.PigeonApiMlKitAnalyzerResultConsumerProxyApi
import dev.zeekr.camerax_android.PigeonApiVideoRecordEventConsumerProxyApi

class ImageProxyConsumerImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiImageProxyConsumerProxyApi(registrar) {
    override fun pigeon_defaultConstructor(): ImageProxyConsumer {
        return ImageProxyConsumer(this)
    }
}

class MlKitAnalyzerResultConsumerImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiMlKitAnalyzerResultConsumerProxyApi(registrar) {
    override fun pigeon_defaultConstructor(): MlKitAnalyzerResultConsumer {
        return MlKitAnalyzerResultConsumer(this)
    }
}

class VideoRecordEventConsumerImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiVideoRecordEventConsumerProxyApi(registrar) {
    override fun pigeon_defaultConstructor(): VideoRecordEventConsumer {
        return VideoRecordEventConsumer(this)
    }
}

class ImageProxyConsumer(private val impl: ImageProxyConsumerImpl) : Consumer<ImageProxy> {
    override fun accept(value: ImageProxy) {
        impl.accept(this, value) {}
    }
}

class MlKitAnalyzerResultConsumer(private val impl: MlKitAnalyzerResultConsumerImpl) :
    Consumer<MlKitAnalyzer.Result> {
    override fun accept(value: MlKitAnalyzer.Result) {
        impl.accept(this, value) {}
    }
}

class VideoRecordEventConsumer(private val impl: VideoRecordEventConsumerImpl) : Consumer<VideoRecordEvent> {
    override fun accept(value: VideoRecordEvent) {
        impl.accept(this, value) {}
    }
}
