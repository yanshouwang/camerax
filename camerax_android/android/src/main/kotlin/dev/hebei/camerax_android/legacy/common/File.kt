package dev.hebei.camerax_android.legacy.common

val java.io.File.args: String get() = path

val String.fileObj get() = java.io.File(this)