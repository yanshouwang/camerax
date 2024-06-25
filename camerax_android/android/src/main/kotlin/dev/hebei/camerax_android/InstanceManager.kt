package dev.hebei.camerax_android

import java.lang.ref.WeakReference

typealias FinalizationListener = (identifier: Long) -> Unit

@Suppress("UNCHECKED_CAST")
object InstanceManager {
    private val instances = mutableMapOf<Long, Any>()

    private fun add(id: Long, instance: Any) {
        if (instances.containsKey(id)) {
            throw IllegalArgumentException(String.format("Identifier has already been added: %d", id))
        }
        instances[id] = instance
    }

    fun <T> remove(identifier: Long): T? {
        return instances.remove(identifier) as T?
    }

    fun <T> getInstance(identifier: Long): T? {
        return instances[identifier] as T?
    }

    fun clear() {
        instances.clear()
    }
}