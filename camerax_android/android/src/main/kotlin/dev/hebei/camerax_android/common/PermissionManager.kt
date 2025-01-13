package dev.hebei.camerax_android.common

import android.Manifest
import android.content.pm.PackageManager
import android.os.Build
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.PluginRegistry
import kotlin.coroutines.resume
import kotlin.coroutines.resumeWithException
import kotlin.coroutines.suspendCoroutine

object PermissionManager {
    private const val REQUEST_CODE = 1949
    private var binding: ActivityPluginBinding? = null

    fun checkPermission(permission: Permission): Boolean {
        val binding = binding ?: throw IllegalStateException("Activity binding is null.")
        val activity = binding.activity
        return permission.values.all { value ->
            ContextCompat.checkSelfPermission(
                activity, value
            ) == PackageManager.PERMISSION_GRANTED
        }
    }

    suspend fun requestPermissions(permissions: List<Permission>): Boolean {
        return suspendCoroutine { continuation ->
            try {
                val binding =
                    this.binding ?: throw IllegalStateException("Activity binding is null.")
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

    internal fun onAttachedToActivity(binding: ActivityPluginBinding) {
        this.binding = binding
    }

    internal fun onDetachedFromActivity() {
        this.binding = null
    }

    enum class Permission {
        ALBUM, AUDIO, VIDEO,
    }
}

val PermissionManager.Permission.values
    get() = when (this) {
        PermissionManager.Permission.ALBUM -> if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) emptyArray()
        else arrayOf(
            Manifest.permission.READ_EXTERNAL_STORAGE, Manifest.permission.WRITE_EXTERNAL_STORAGE
        )

        PermissionManager.Permission.AUDIO -> arrayOf(Manifest.permission.RECORD_AUDIO)
        PermissionManager.Permission.VIDEO -> arrayOf(Manifest.permission.CAMERA)
    }

val List<PermissionManager.Permission>.values: Array<String>
    get() = flatMap { values.toList() }.toTypedArray()