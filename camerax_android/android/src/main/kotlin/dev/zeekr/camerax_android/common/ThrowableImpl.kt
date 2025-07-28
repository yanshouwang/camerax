package dev.zeekr.camerax_android.common

import android.util.Log

val Throwable.api: List<Any?>
    get() {
        val exception = this
        return listOf(
            exception.javaClass.simpleName,
            exception.toString(),
            "Cause: " + exception.cause + ", Stacktrace: " + Log.getStackTraceString(exception)
        )
    }