package dev.hebei.camerax_android.legacy.common

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiMlKitAnalyzerResultConsumer
import dev.hebei.camerax_android.legacy.PigeonApiVideoRecordEventConsumer

class VideoRecordEventConsumer(registrar: CameraXRegistrar) : PigeonApiVideoRecordEventConsumer(registrar) {
    override fun pigeon_defaultConstructor(): Impl {
        return Impl(this)
    }

    class Impl(private val api: VideoRecordEventConsumer) :
        androidx.core.util.Consumer<androidx.camera.video.VideoRecordEvent> {
        override fun accept(value: androidx.camera.video.VideoRecordEvent) {
            api.accept(this, value) {}
        }
    }
}

class MlKitAnalyzerResultConsumer(registrar: CameraXRegistrar) : PigeonApiMlKitAnalyzerResultConsumer(registrar) {
    override fun pigeon_defaultConstructor(): Impl {
        return Impl(this)
    }

    class Impl(private val api: MlKitAnalyzerResultConsumer) :
        androidx.core.util.Consumer<androidx.camera.mlkit.vision.MlKitAnalyzer.Result> {
        override fun accept(value: androidx.camera.mlkit.vision.MlKitAnalyzer.Result) {
            api.accept(this, value) {}
        }
    }
}