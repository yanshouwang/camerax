package dev.hebei.camerax_android.common

import android.Manifest
import android.content.pm.PackageManager
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.PluginRegistry
import kotlin.coroutines.resume
import kotlin.coroutines.resumeWithException
import kotlin.coroutines.suspendCoroutine

object PermissionManager : ActivityAware {
    private const val REQUEST_CODE = 1949
    private var binding: ActivityPluginBinding? = null

    fun checkPermission(permission: Permission): Boolean {
        val binding = binding ?: throw NullPointerException("Activity binding is null")
        val activity = binding.activity
        return ContextCompat.checkSelfPermission(activity, permission.value) == PackageManager.PERMISSION_GRANTED
    }

    suspend fun requestPermissions(permissions: List<Permission>): Boolean {
        return suspendCoroutine { continuation ->
            try {
                val binding = binding ?: throw NullPointerException("Activity binding is null")
                val activity = binding.activity
                val listener = object : PluginRegistry.RequestPermissionsResultListener {
                    override fun onRequestPermissionsResult(
                        requestCode: Int, permissions: Array<out String>, grantResults: IntArray
                    ): Boolean {
                        if (requestCode != REQUEST_CODE) {
                            return false
                        }
                        // grantResults could be empty if the permissions request with the user is interrupted
                        // https://developer.android.com/reference/android/app/Activity#onRequestPermissionsResult(int,%20java.lang.String[],%20int[])
                        val isGranted =
                            grantResults.isNotEmpty() && grantResults.all { it == PackageManager.PERMISSION_GRANTED }
                        continuation.resume(isGranted)
                        binding.removeRequestPermissionsResultListener(this)
                        return true
                    }
                }
                binding.addRequestPermissionsResultListener(listener)
                ActivityCompat.requestPermissions(activity, permissions.values, REQUEST_CODE)
            } catch (e: Exception) {
                continuation.resumeWithException(e)
            }
        }
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        this.binding = binding
    }

    override fun onDetachedFromActivityForConfigChanges() {
        onDetachedFromActivity()
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        onAttachedToActivity(binding)
    }

    override fun onDetachedFromActivity() {
        this.binding = null
    }

    enum class Permission {
        VIDEO, AUDIO,
    }
}

val PermissionManager.Permission.value: String
    get() = when (this) {
        PermissionManager.Permission.VIDEO -> Manifest.permission.CAMERA
        PermissionManager.Permission.AUDIO -> Manifest.permission.RECORD_AUDIO
    }

val List<PermissionManager.Permission>.values: Array<String>
    get() = map { it.value }.toTypedArray()