package dev.hebei.camerax_android

class InstanceManagerAPI(private val instanceManager: InstanceManager) : InstanceManagerHostAPI {
    override fun clear() {
        instanceManager.clear()
    }
}