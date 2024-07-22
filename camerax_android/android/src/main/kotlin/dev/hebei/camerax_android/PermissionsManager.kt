package dev.hebei.camerax_android

import android.content.pm.PackageManager
import androidx.annotation.Keep
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.PluginRegistry.RequestPermissionsResultListener

object PermissionsManager {
    private const val REQUEST_CODE = 1949
    private val listener: RequestPermissionsResultListener = RequestPermissionsResultListener { requestCode, _, grantResults ->
        if (requestCode != REQUEST_CODE) {
            return@RequestPermissionsResultListener false
        }
        val callback = this.callback ?: return@RequestPermissionsResultListener false
        this.callback = null
        // grantResults could be empty if the permissions request with the user is interrupted
        // https://developer.android.com/reference/android/app/Activity#onRequestPermissionsResult(int,%20java.lang.String[],%20int[])
        val granted = grantResults.isNotEmpty() && grantResults.all { it == PackageManager.PERMISSION_GRANTED }
        callback.onPermissionsResult(granted)
        return@RequestPermissionsResultListener true

    }
    private var binding: ActivityPluginBinding? = null
    private var callback: PermissionsResultCallback? = null

    @Keep
    fun checkPermissions(permissions: Array<String>): Boolean {
        val binding = this.binding ?: throw IllegalStateException("Activity binding is null.")
        val activity = binding.activity
        return permissions.all { permission ->
            ContextCompat.checkSelfPermission(activity, permission) == PackageManager.PERMISSION_GRANTED
        }
    }

    @Keep
    fun requestPermissions(permissions: Array<String>, callback: PermissionsResultCallback) {
        if (this.callback != null) {
            throw IllegalStateException("Another request is ongoing and multiple requests cannot be handled at once.")
        }
        this.callback = callback
        val binding = this.binding ?: throw IllegalStateException("Activity binding is null.")
        val activity = binding.activity
        ActivityCompat.requestPermissions(activity, permissions, REQUEST_CODE)
    }

    internal fun updateActivity(binding: ActivityPluginBinding?) {
        this.binding?.removeRequestPermissionsResultListener(listener)
        binding?.addRequestPermissionsResultListener(listener)
        this.binding = binding
    }
}