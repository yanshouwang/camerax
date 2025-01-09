package dev.hebei.camerax_android.view.video

import android.Manifest
import androidx.annotation.RequiresPermission

class AudioConfig internal constructor(internal val obj: androidx.camera.view.video.AudioConfig) {
    companion object {
        @RequiresPermission(Manifest.permission.RECORD_AUDIO)
        fun create(enableAudio: Boolean): AudioConfig {
            val obj = androidx.camera.view.video.AudioConfig.create(enableAudio)
            return AudioConfig(obj)
        }
    }

    val audioEnabled get() = obj.audioEnabled
}