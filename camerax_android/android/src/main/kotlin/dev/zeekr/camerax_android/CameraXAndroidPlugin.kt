package dev.zeekr.camerax_android

import dev.zeekr.camerax_android.common.PermissionManager
import dev.zeekr.camerax_android.common.ViewFactory
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

/** CameraXAndroidPlugin */
class CameraXAndroidPlugin : FlutterPlugin, ActivityAware {
    private lateinit var impl: CameraXImpl

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        val binaryMessenger = binding.binaryMessenger
        val context = binding.applicationContext
        impl = CameraXImpl(binaryMessenger, context)
        impl.setUp()
        val viewTypeId = "camerax.zeekr.dev/PreviewView"
        val viewFactory = ViewFactory(impl.instanceManager)
        binding.platformViewRegistry.registerViewFactory(viewTypeId, viewFactory)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        impl.tearDown()
        impl.instanceManager.stopFinalizationListener()
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        PermissionManager.onAttachedToActivity(binding)
        impl.onAttachedToActivity(binding)
    }

    override fun onDetachedFromActivityForConfigChanges() {
        PermissionManager.onDetachedFromActivityForConfigChanges()
        impl.onDetachedFromActivityForConfigChanges()
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        PermissionManager.onReattachedToActivityForConfigChanges(binding)
        impl.onReattachedToActivityForConfigChanges(binding)
    }

    override fun onDetachedFromActivity() {
        PermissionManager.onDetachedFromActivity()
        impl.onDetachedFromActivity()
    }
}
