package dev.hebei.camerax_android

import android.os.Handler
import android.os.Looper
import android.util.Log
import java.lang.ref.ReferenceQueue
import java.lang.ref.WeakReference
import java.util.WeakHashMap

/**
 * Maintains instances used to communicate with the corresponding objects in Dart.
 *
 *
 * Objects stored in this container are represented by an object in Dart that is also stored in
 * an InstanceManager with the same identifier.
 *
 *
 * When an instance is added with an identifier, either can be used to retrieve the other.
 *
 *
 * Added instances are added as a weak reference and a strong reference. When the strong
 * reference is removed with `[.remove]` and the weak reference is deallocated, the
 * `finalizationListener` is made with the instance's identifier. However, if the strong reference
 * is removed and then the identifier is retrieved with the intention to pass the identifier to Dart
 * (e.g. calling [.getIdentifierForStrongReference]), the strong reference to the
 * instance is recreated. The strong reference will then need to be removed manually again.
 */
@Suppress("UNCHECKED_CAST")
class InstanceManager private constructor(private val finalizationListener: FinalizationListener) {
    companion object {
        // Identifiers are locked to a specific range to avoid collisions with objects
        // created simultaneously from Dart.
        // Host uses identifiers >= 2^16 and Dart is expected to use values n where,
        // 0 <= n < 2^16.
        private const val MIN_HOST_CREATED_IDENTIFIER: Long = 65536
        private const val CLEAR_FINALIZED_WEAK_REFERENCES_INTERVAL: Long = 3000
        private const val TAG = "InstanceManager"

        /**
         * Instantiate a new manager.
         *
         *
         * When the manager is no longer needed, [.stopFinalizationListener] must be called.
         *
         * @param finalizationListener the listener for garbage collected weak references.
         * @return a new `InstanceManager`.
         */
        fun create(finalizationListener: FinalizationListener): InstanceManager {
            return InstanceManager(finalizationListener)
        }
    }

    /** Interface for listening when a weak reference of an instance is removed from the manager.  */
    interface FinalizationListener {
        fun onFinalize(identifier: Long)
    }

    private val identifiers = WeakHashMap<Any?, Long>()
    private val weakInstances = HashMap<Long, WeakReference<Any>>()
    private val strongInstances = HashMap<Long, Any?>()
    private val referenceQueue = ReferenceQueue<Any>()
    private val weakReferencesToIdentifiers = HashMap<WeakReference<Any>, Long>()
    private val handler = Handler(Looper.getMainLooper())
    private var nextIdentifier = MIN_HOST_CREATED_IDENTIFIER
    private var hasFinalizationListenerStopped = false

    init {
        handler.postDelayed({ releaseAllFinalizedInstances() }, CLEAR_FINALIZED_WEAK_REFERENCES_INTERVAL)
    }

    /**
     * Removes `identifier` and its associated strongly referenced instance, if present, from the
     * manager.
     *
     * @param identifier the identifier paired to an instance.
     * @param <T> the expected return type.
     * @return the removed instance if the manager contains the given identifier, otherwise `null` if
     * the manager doesn't contain the value.
    </T> */
    fun <T> remove(identifier: Long): T? {
        logWarningIfFinalizationListenerHasStopped()
        return strongInstances.remove(identifier) as T?
    }

    /**
     * Retrieves the identifier paired with an instance.
     *
     *
     * If the manager contains a strong reference to `instance`, it will return the identifier
     * associated with `instance`. If the manager contains only a weak reference to `instance`, a new
     * strong reference to `instance` will be added and will need to be removed again with [ ][.remove].
     *
     *
     * If this method returns a nonnull identifier, this method also expects the Dart
     * `InstanceManager` to have, or recreate, a weak reference to the Dart instance the identifier is
     * associated with.
     *
     * @param instance an instance that may be stored in the manager.
     * @return the identifier associated with `instance` if the manager contains the value, otherwise
     * `null` if the manager doesn't contain the value.
     */
    fun getIdentifierForStrongReference(instance: Any?): Long? {
        logWarningIfFinalizationListenerHasStopped()
        val identifier = identifiers[instance]
        if (identifier != null) {
            strongInstances[identifier] = instance
        }
        return identifier
    }

    /**
     * Adds a new instance that was instantiated from Dart.
     *
     *
     * The same instance can be added multiple times, but each identifier must be unique. This
     * allows two objects that are equivalent (e.g. the `equals` method returns true and their
     * hashcodes are equal) to both be added.
     *
     * @param instance the instance to be stored.
     * @param identifier the identifier to be paired with instance. This value must be >= 0 and
     * unique.
     */
    fun addDartCreatedInstance(instance: Any, identifier: Long) {
        logWarningIfFinalizationListenerHasStopped()
        addInstance(instance, identifier)
    }

    /**
     * Adds a new instance that was instantiated from the host platform.
     *
     * @param instance the instance to be stored. This must be unique to all other added instances.
     * @return the unique identifier (>= 0) stored with instance.
     */
    fun addHostCreatedInstance(instance: Any): Long {
        logWarningIfFinalizationListenerHasStopped()
        require(!containsInstance(instance)) { "Instance of " + instance.javaClass + " has already been added." }
        val identifier = nextIdentifier++
        addInstance(instance, identifier)
        return identifier
    }

    /**
     * Retrieves the instance associated with identifier.
     *
     * @param identifier the identifier associated with an instance.
     * @param <T> the expected return type.
     * @return the instance associated with `identifier` if the manager contains the value, otherwise
     * `null` if the manager doesn't contain the value.
    </T> */
    fun <T> getInstance(identifier: Long): T? {
        logWarningIfFinalizationListenerHasStopped()
        val instance = weakInstances[identifier] as WeakReference<T>?
        return instance?.get()
    }

    /**
     * Returns whether this manager contains the given `instance`.
     *
     * @param instance the instance whose presence in this manager is to be tested.
     * @return whether this manager contains the given `instance`.
     */
    fun containsInstance(instance: Any?): Boolean {
        logWarningIfFinalizationListenerHasStopped()
        return identifiers.containsKey(instance)
    }

    /**
     * Stop the periodic run of the [FinalizationListener] for instances that have been garbage
     * collected.
     *
     *
     * The InstanceManager can continue to be used, but the [FinalizationListener] will no
     * longer be called and methods will log a warning.
     */
    fun stopFinalizationListener() {
        handler.removeCallbacks { releaseAllFinalizedInstances() }
        hasFinalizationListenerStopped = true
    }

    /**
     * Removes all of the instances from this manager.
     *
     *
     * The manager will be empty after this call returns.
     */
    fun clear() {
        identifiers.clear()
        weakInstances.clear()
        strongInstances.clear()
        weakReferencesToIdentifiers.clear()
    }

    /**
     * Whether the [FinalizationListener] is still being called for instances that are garbage
     * collected.
     *
     *
     * See [.stopFinalizationListener].
     */
    fun hasFinalizationListenerStopped(): Boolean {
        return hasFinalizationListenerStopped
    }

    private fun releaseAllFinalizedInstances() {
        if (hasFinalizationListenerStopped()) {
            return
        }
        while (true) {
            val reference = referenceQueue.poll() ?: break
            val identifier = weakReferencesToIdentifiers.remove(reference) ?: continue
            weakInstances.remove(identifier)
            strongInstances.remove(identifier)
            finalizationListener.onFinalize(identifier)
        }
        handler.postDelayed({ releaseAllFinalizedInstances() }, CLEAR_FINALIZED_WEAK_REFERENCES_INTERVAL)
    }

    private fun addInstance(instance: Any, identifier: Long) {
        require(identifier >= 0) { "Identifier must be >= 0: $identifier" }
        if (weakInstances.containsKey(identifier)) {
            throw IllegalArgumentException(String.format("Identifier has already been added: %d", identifier))
        }
        val weakReference = WeakReference(instance, referenceQueue)
        identifiers[instance] = identifier
        weakInstances[identifier] = weakReference
        weakReferencesToIdentifiers[weakReference] = identifier
        strongInstances[identifier] = instance
    }

    private fun logWarningIfFinalizationListenerHasStopped() {
        if (hasFinalizationListenerStopped()) {
            Log.w(TAG, "The manager was used after calls to the FinalizationListener have been stopped.")
        }
    }
}