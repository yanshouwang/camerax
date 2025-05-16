package dev.hebei.camerax_android

import dev.hebei.camerax_android.common.PermissionManager
import dev.hebei.camerax_android.common.ViewFactory
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

/** CameraXAndroidPlugin */
class CameraXAndroidPlugin : FlutterPlugin, ActivityAware {
    private lateinit var impl: CameraXImpl

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        impl = CameraXImpl(binding.applicationContext, binding.binaryMessenger)
        impl.setUp()
        val viewFactory = ViewFactory(impl.instanceManager)
        binding.platformViewRegistry.registerViewFactory(
            "camerax.hebei.dev/PreviewView", viewFactory
        )
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        impl.tearDown()
        impl.instanceManager.stopFinalizationListener()
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        PermissionManager.onAttachedToActivity(binding)
        impl.activity = binding.activity
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        onAttachedToActivity(binding)
    }

    override fun onDetachedFromActivity() {
        PermissionManager.onDetachedFromActivity()
        impl.activity = null
    }

    override fun onDetachedFromActivityForConfigChanges() {
        onDetachedFromActivity()
    }
}
