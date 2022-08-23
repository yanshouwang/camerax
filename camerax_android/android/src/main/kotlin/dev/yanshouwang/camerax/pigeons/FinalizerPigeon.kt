package dev.yanshouwang.camerax.pigeons

import dev.yanshouwang.camerax.InstanceManager

internal class FinalizerPigeon : Pigeons.FinalizerHostPigeon {
    override fun finalize(id: String) {
        InstanceManager.removeById<Any>(id)
    }
}