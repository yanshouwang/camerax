package dev.yanshouwang.camerax

internal class FinalizerPigeon : Pigeons.FinalizerHostPigeon {
    override fun finalize(id: String) {
        InstanceManager.removeById<Any>(id)
    }
}