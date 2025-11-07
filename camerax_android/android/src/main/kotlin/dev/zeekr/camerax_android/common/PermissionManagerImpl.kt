package dev.zeekr.camerax_android.common

import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PermissionManagerPermissionApi
import dev.zeekr.camerax_android.PigeonApiPermissionManagerProxyApi
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

class PermissionManagerImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiPermissionManagerProxyApi(registrar) {
    override fun instance(): PermissionManager {
        return PermissionManager
    }

    override fun checkPermissioin(
        pigeon_instance: PermissionManager,
        permission: PermissionManagerPermissionApi
    ): Boolean {
        return PermissionManager.checkPermission(permission.impl)
    }

    override fun requestPermissions(
        pigeon_instance: PermissionManager,
        permissions: List<PermissionManagerPermissionApi>,
        callback: (Result<Boolean>) -> Unit
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

val PermissionManagerPermissionApi.impl: PermissionManager.Permission
    get() = when (this) {
        PermissionManagerPermissionApi.VIDEO -> PermissionManager.Permission.VIDEO
        PermissionManagerPermissionApi.AUDIO -> PermissionManager.Permission.AUDIO
    }