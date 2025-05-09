package dev.hebei.camerax_android.common

import dev.hebei.camerax_android.CameraXRegistrar
import dev.hebei.camerax_android.PigeonApiMlKitAnalyzerResultConsumerApi
import dev.hebei.camerax_android.PigeonApiVideoRecordEventConsumerApi

class VideoRecordEventConsumerImpl(registrar: CameraXRegistrar) : PigeonApiVideoRecordEventConsumerApi(registrar) {
    override fun pigeon_defaultConstructor(): VideoRecordEventConsumer {
        return VideoRecordEventConsumer(this)
    }
}

class MlKitAnalyzerResultConsumerImpl(registrar: CameraXRegistrar) :
    PigeonApiMlKitAnalyzerResultConsumerApi(registrar) {
    override fun pigeon_defaultConstructor(): MlKitAnalyzerResultConsumer {
        return MlKitAnalyzerResultConsumer(this)
    }
}

class VideoRecordEventConsumer(private val api: PigeonApiVideoRecordEventConsumerApi) :
    androidx.core.util.Consumer<androidx.camera.video.VideoRecordEvent> {
    override fun accept(value: androidx.camera.video.VideoRecordEvent) {
        api.accept(this, value) {}
    }
}

class MlKitAnalyzerResultConsumer(private val api: PigeonApiMlKitAnalyzerResultConsumerApi) :
    androidx.core.util.Consumer<androidx.camera.mlkit.vision.MlKitAnalyzer.Result> {
    override fun accept(value: androidx.camera.mlkit.vision.MlKitAnalyzer.Result) {
        api.accept(this, value) {}
    }
}