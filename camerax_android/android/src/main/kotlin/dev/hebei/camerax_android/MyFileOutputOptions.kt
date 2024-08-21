package dev.hebei.camerax_android

import androidx.annotation.Keep
import androidx.camera.video.FileOutputOptions
import java.io.File

@Keep
class MyFileOutputOptions {
    class MyBuilder(file: File) {
        private val builder = FileOutputOptions.Builder(file)

        fun build(): FileOutputOptions {
            return builder.build()
        }
    }
}