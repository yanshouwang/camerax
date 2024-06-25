package dev.hebei.camerax_android

import android.Manifest.permission
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

object PermissionsManagerAPI : PermissionsManagerHostAPI {
    private var binding: ActivityPluginBinding? = null

    override fun requestPermissions(enableAudioArgs: Boolean, callback: (Result<Boolean>) -> Unit) {
        try {
            val binding = this.binding ?: throw IllegalStateException()
            val permissions = if (enableAudioArgs) arrayOf(permission.CAMERA, permission.RECORD_AUDIO)
            else arrayOf(permission.CAMERA)
            PermissionsManager.requestPermissions(binding, permissions) { granted ->
                callback(Result.success(granted))
            }
        } catch (e: Throwable) {
            callback(Result.failure(e))
        }
    }

    internal fun updateActivity(binding: ActivityPluginBinding?) {
        this.binding = binding
    }
}