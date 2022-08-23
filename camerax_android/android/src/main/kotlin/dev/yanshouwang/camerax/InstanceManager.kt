package dev.yanshouwang.camerax

internal object InstanceManager {
    private val instances = mutableMapOf<String, Any>()
    private val ids = mutableMapOf<Any, String>()

    fun <T : Any> add(id: String, instance: T) {
        if (instances[id] != null || ids[instance] != null) {
            throw  IllegalArgumentException()
        }
        instances[id] = instance
        ids[instance] = id
    }

    inline fun <reified T : Any> removeById(id: String): T? {
        val instance = instances.remove(id)
        ids.remove(instance)
        if (instance is T?) {
            return instance
        } else {
            throw IllegalArgumentException()
        }
    }

    fun <T : Any> removeByInstance(instance: T): String? {
        val key = ids.remove(instance)
        instances.remove(key)
        return key
    }

    inline fun <reified T : Any> removeAll(): List<T> {
        val instances = this.instances.mapNotNull { entry ->
            if (entry.value is T) {
                entry.value as T
            } else {
                null
            }
        }
        for (instance in instances) {
            removeByInstance(instance)
        }
        return instances
    }

    inline fun <reified T : Any> findInstance(id: String): T? {
        val instance = instances[id]
        if (instance is T?) {
            return instance
        } else {
            throw  IllegalArgumentException()
        }
    }

    fun findId(instance: Any): String? {
        return ids[instance]
    }
}