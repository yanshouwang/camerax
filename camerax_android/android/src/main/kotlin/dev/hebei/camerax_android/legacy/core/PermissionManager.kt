package dev.hebei.camerax_android.legacy.core

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.Permission
import dev.hebei.camerax_android.legacy.PigeonApiPermissionManager
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

class PermissionManager(registrar: CameraXRegistrar) : PigeonApiPermissionManager(registrar) {
    override fun instance(): dev.hebei.camerax_android.core.PermissionManager {
        return dev.hebei.camerax_android.core.PermissionManager
    }

    override fun checkPermissioin(
        pigeon_instance: dev.hebei.camerax_android.core.PermissionManager, permission: Permission
    ): Boolean {
        return pigeon_instance.checkPermission(permission.obj)
    }

    override fun requestPermissions(
        pigeon_instance: dev.hebei.camerax_android.core.PermissionManager,
        permissions: List<Permission>,
        callback: (Result<Boolean>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val permissionObjs = permissions.map { permission -> permission.obj }
                val isGranted = pigeon_instance.requestPermissions(permissionObjs)
                callback(Result.success(isGranted))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }
}

val Permission.obj
    get() = when (this) {
        Permission.ALBUM -> dev.hebei.camerax_android.core.PermissionManager.Permission.ALBUM
        Permission.AUDIO -> dev.hebei.camerax_android.core.PermissionManager.Permission.AUDIO
        Permission.VIDEO -> dev.hebei.camerax_android.core.PermissionManager.Permission.VIDEO
    }