package dev.zeekr.camerax_android.common

import androidx.camera.mlkit.vision.MlKitAnalyzer
import androidx.camera.video.VideoRecordEvent
import androidx.core.util.Consumer
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiMlKitAnalyzerResultConsumerApi
import dev.zeekr.camerax_android.PigeonApiVideoRecordEventConsumerApi

class VideoRecordEventConsumerImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiVideoRecordEventConsumerApi(registrar) {
    override fun pigeon_defaultConstructor(): VideoRecordEventConsumer {
        return VideoRecordEventConsumer(this)
    }
}

class MlKitAnalyzerResultConsumerImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiMlKitAnalyzerResultConsumerApi(registrar) {
    override fun pigeon_defaultConstructor(): MlKitAnalyzerResultConsumer {
        return MlKitAnalyzerResultConsumer(this)
    }
}

class VideoRecordEventConsumer(private val impl: VideoRecordEventConsumerImpl) : Consumer<VideoRecordEvent> {
    override fun accept(value: VideoRecordEvent) {
        impl.accept(this, value) {}
    }
}

class MlKitAnalyzerResultConsumer(private val impl: MlKitAnalyzerResultConsumerImpl) :
    Consumer<MlKitAnalyzer.Result> {
    override fun accept(value: MlKitAnalyzer.Result) {
        impl.accept(this, value) {}
    }
}