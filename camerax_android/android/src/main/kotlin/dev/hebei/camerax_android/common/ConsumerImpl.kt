package dev.hebei.camerax_android.common

import androidx.camera.mlkit.vision.MlKitAnalyzer
import androidx.camera.video.VideoRecordEvent
import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.PigeonApiMlKitAnalyzerResultConsumerApi
import dev.hebei.camerax_android.PigeonApiVideoRecordEventConsumerApi

class VideoRecordEventConsumerImpl(impl: CameraXImpl) : PigeonApiVideoRecordEventConsumerApi(impl) {
    override fun pigeon_defaultConstructor(): VideoRecordEventConsumer {
        return VideoRecordEventConsumer(this)
    }
}

class MlKitAnalyzerResultConsumerImpl(impl: CameraXImpl) : PigeonApiMlKitAnalyzerResultConsumerApi(impl) {
    override fun pigeon_defaultConstructor(): MlKitAnalyzerResultConsumer {
        return MlKitAnalyzerResultConsumer(this)
    }
}

class VideoRecordEventConsumer(private val impl: VideoRecordEventConsumerImpl) :
    androidx.core.util.Consumer<VideoRecordEvent> {
    override fun accept(value: VideoRecordEvent) {
        impl.accept(this, value) {}
    }
}

class MlKitAnalyzerResultConsumer(private val impl: MlKitAnalyzerResultConsumerImpl) :
    androidx.core.util.Consumer<MlKitAnalyzer.Result> {
    override fun accept(value: MlKitAnalyzer.Result) {
        impl.accept(this, value) {}
    }
}