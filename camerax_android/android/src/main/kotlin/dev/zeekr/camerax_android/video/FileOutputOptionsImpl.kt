package dev.zeekr.camerax_android.video

import android.location.Location
import androidx.camera.video.FileOutputOptions
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiFileOutputOptionsBuilderProxyApi
import dev.zeekr.camerax_android.PigeonApiFileOutputOptionsProxyApi
import dev.zeekr.camerax_android.common.api
import dev.zeekr.camerax_android.common.fileImpl

class FileOutputOptionsImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiFileOutputOptionsProxyApi(registrar) {
    class BuilderImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
        PigeonApiFileOutputOptionsBuilderProxyApi(registrar) {
        override fun pigeon_defaultConstructor(file: String): FileOutputOptions.Builder {
            return FileOutputOptions.Builder(file.fileImpl)
        }

        override fun setDurationLimitMillis(
            pigeon_instance: FileOutputOptions.Builder, durationLimitMillis: Long
        ): FileOutputOptions.Builder {
            return pigeon_instance.setDurationLimitMillis(durationLimitMillis)
        }

        override fun setFileSizeLimit(
            pigeon_instance: FileOutputOptions.Builder, fileSizeLimitBytes: Long
        ): FileOutputOptions.Builder {
            return pigeon_instance.setFileSizeLimit(fileSizeLimitBytes)
        }

        override fun setLocation(
            pigeon_instance: FileOutputOptions.Builder, location: Location?
        ): FileOutputOptions.Builder {
            return pigeon_instance.setLocation(location)
        }

        override fun build(pigeon_instance: FileOutputOptions.Builder): FileOutputOptions {
            return pigeon_instance.build()
        }
    }

    override fun getFile(pigeon_instance: FileOutputOptions): String {
        return pigeon_instance.file.api
    }
}