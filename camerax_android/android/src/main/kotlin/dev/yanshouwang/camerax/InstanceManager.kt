package dev.yanshouwang.camerax

internal object InstanceManager {
    private val instances = mutableMapOf<String, Any>()
    private val ids = mutableMapOf<Any, String>()

    fun add(id: String, instance: Any) {
        instances[id] = instance
        ids[instance] = id
    }

    fun removeByInstance(instance: Any) {
        val key = ids.remove(instance) ?: throw IllegalArgumentException()
        instances.remove(key) ?: throw IllegalArgumentException()
    }

    fun removeById(id: String) {
        val instance = instances.remove(id) ?: throw IllegalArgumentException()
        ids.remove(instance) ?: throw  IllegalArgumentException()
    }

    inline fun <reified T> findInstance(id: String): T? {
        val instance = instances[id]
        if (instance is T?) {
            return instance
        } else {
            throw  IllegalArgumentException()
        }
    }

    fun findId(instance: Any): String {
        return ids[instance] ?: throw IllegalArgumentException()
    }
}