package dev.hebei.camerax_android

object InstanceManagerAPI : InstanceManagerHostAPI {
    override fun clear() {
        InstanceManager.clear()
    }
}