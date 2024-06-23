package dev.hebei.camerax_android

import android.Manifest.permission
import android.app.Activity

class PermissionsManagerAPI : PermissionsManagerHostAPI {
    private val permissionsManager = PermissionsManager()

    var activity: Activity? = null
    var registry: PermissionsRegistry? = null

    override fun requestPermissions(enableAudioArgs: Boolean, callback: (Result<Boolean>) -> Unit) {
        try {
            val activity = this.activity
            val registry = this.registry
            if (activity == null || registry == null) {
                throw IllegalStateException("Activity must be set to request permissions.")
            }
            val permissions = if (enableAudioArgs) arrayOf(permission.CAMERA, permission.RECORD_AUDIO)
            else arrayOf(permission.CAMERA)
            permissionsManager.requestPermissions(activity, registry, permissions) { granted ->
                callback(Result.success(granted))
            }
        } catch (e: Throwable) {
            callback(Result.failure(e))
        }
    }
}