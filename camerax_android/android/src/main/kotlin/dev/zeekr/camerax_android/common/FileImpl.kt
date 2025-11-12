package dev.zeekr.camerax_android.common

import java.io.File

val File.api: String get() = path

val String.fileImpl: File get() = File(this)