package dev.hebei.camerax_android.common

import java.io.File

val File.api: String get() = path

val String.fileImpl get() = File(this)