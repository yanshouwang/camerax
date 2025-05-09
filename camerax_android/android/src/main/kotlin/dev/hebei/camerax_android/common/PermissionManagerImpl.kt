package dev.hebei.camerax_android.common

import dev.hebei.camerax_android.CameraXRegistrar
import dev.hebei.camerax_android.PermissionApi
import dev.hebei.camerax_android.PigeonApiPermissionManagerApi
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

class PermissionManagerImpl(registrar: CameraXRegistrar) : PigeonApiPermissionManagerApi(registrar) {
    override fun instance(): PermissionManager {
        return PermissionManager
    }

    override fun checkPermissioin(
        pigeon_instance: PermissionManager, permission: PermissionApi
    ): Boolean {
        return PermissionManager.checkPermission(permission.impl)
    }

    override fun requestPermissions(
        pigeon_instance: PermissionManager, permissions: List<PermissionApi>, callback: (Result<Boolean>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val permissionObjs = permissions.map { permission -> permission.impl }
                val isGranted = PermissionManager.requestPermissions(permissionObjs)
                callback(Result.success(isGranted))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }
}

val PermissionApi.impl
    get() = when (this) {
        PermissionApi.ALBUM -> PermissionManager.Permission.ALBUM
        PermissionApi.AUDIO -> PermissionManager.Permission.AUDIO
        PermissionApi.VIDEO -> PermissionManager.Permission.VIDEO
    }