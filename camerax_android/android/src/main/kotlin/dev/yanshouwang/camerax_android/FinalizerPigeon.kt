package dev.yanshouwang.camerax_android

internal class FinalizerPigeon : Pigeons.FinalizerHostPigeon {
    override fun finalize(id: String) {
        InstanceManager.removeById<Any>(id)
    }
}