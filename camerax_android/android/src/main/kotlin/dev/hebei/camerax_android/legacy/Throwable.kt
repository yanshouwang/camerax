package dev.hebei.camerax_android.legacy

import android.util.Log

val Throwable.args: List<Any?>
    get() {
        val exception = this
        return listOf(
            exception.javaClass.simpleName,
            exception.toString(),
            "Cause: " + exception.cause + ", Stacktrace: " + Log.getStackTraceString(exception)
        )
    }