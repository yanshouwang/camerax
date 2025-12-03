package dev.zeekr.camerax_android.common

import android.net.Uri
import androidx.core.net.toUri

val Uri.api: String? get() = path

val String.uriImpl: Uri get() = this.toUri()