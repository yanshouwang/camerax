package dev.hebei.camerax_android.common

val java.io.File.api: String get() = path

val String.fileImpl get() = java.io.File(this)