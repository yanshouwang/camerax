package dev.zeekr.camerax_android.common

import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PermissionApi
import dev.zeekr.camerax_android.PigeonApiPermissionManagerApi
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

class PermissionManagerImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiPermissionManagerApi(registrar) {
    override fun instance(): PermissionManager {
        return PermissionManager
    }

    override fun checkPermissioin(pigeon_instance: PermissionManager, permission: PermissionApi): Boolean {
        return PermissionManager.checkPermission(permission.impl)
    }

    override fun requestPermissions(
        pigeon_instance: PermissionManager, permissions: List<PermissionApi>, callback: (Result<Boolean>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val permissionImpls = permissions.map { permission -> permission.impl }
                val isGranted = PermissionManager.requestPermissions(permissionImpls)
                callback(Result.success(isGranted))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }
}

val PermissionApi.impl: PermissionManager.Permission
    get() = when (this) {
        PermissionApi.VIDEO -> PermissionManager.Permission.VIDEO
        PermissionApi.AUDIO -> PermissionManager.Permission.AUDIO
    }