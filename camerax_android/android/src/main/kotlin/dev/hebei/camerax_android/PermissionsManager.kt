package dev.hebei.camerax_android

import android.content.pm.PackageManager
import androidx.annotation.VisibleForTesting
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

typealias PermissionsResultCallback = (granted: Boolean) -> Unit

object PermissionsManager {
    private const val REQUEST_CODE = 1949

    @VisibleForTesting
    var ongoing = false

    fun requestPermissions(binding: ActivityPluginBinding, permissions: Array<String>, callback: PermissionsResultCallback) {
        if (ongoing) {
            throw IllegalStateException("Another request is ongoing and multiple requests cannot be handled at once.")
        }
        val activity = binding.activity
        val checked = permissions.all { permission -> ContextCompat.checkSelfPermission(activity, permission) == PackageManager.PERMISSION_GRANTED }
        if (checked) {
            // Permissions already exist. Call the callback with success.
            callback(true)
        } else {
            binding.addRequestPermissionsResultListener { requestCode, _, grantResults ->
                if (requestCode != REQUEST_CODE) {
                    return@addRequestPermissionsResultListener false
                }
                ongoing = false
                // grantResults could be empty if the permissions request with the user is interrupted
                // https://developer.android.com/reference/android/app/Activity#onRequestPermissionsResult(int,%20java.lang.String[],%20int[])
                val granted = grantResults.isNotEmpty() && grantResults.all { it == PackageManager.PERMISSION_GRANTED }
                callback(granted)
                return@addRequestPermissionsResultListener true
            }
            ongoing = true
            ActivityCompat.requestPermissions(activity, permissions, REQUEST_CODE)
        }
    }
}