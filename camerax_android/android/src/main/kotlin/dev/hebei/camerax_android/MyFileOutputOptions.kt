package dev.hebei.camerax_android

import androidx.camera.video.FileOutputOptions
import java.io.File

class MyFileOutputOptions {
    class Builder(file: File) {
        private val builder = FileOutputOptions.Builder(file)

        fun build(): FileOutputOptions {
            return builder.build()
        }
    }
}