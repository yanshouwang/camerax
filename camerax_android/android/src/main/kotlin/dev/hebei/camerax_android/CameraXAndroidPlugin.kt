package dev.hebei.camerax_android

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

/** CameraXAndroidPlugin */
class CameraXAndroidPlugin : FlutterPlugin, ActivityAware {
    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        val binaryMessenger = binding.binaryMessenger
        val viewRegistry = binding.platformViewRegistry
        PermissionsManagerHostAPI.setUp(binaryMessenger, PermissionsManagerAPI)
        viewRegistry.registerViewFactory("hebei.dev/PreviewView", PreviewViewFactory)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        val binaryMessenger = binding.binaryMessenger
        PermissionsManagerHostAPI.setUp(binaryMessenger, null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        PreviewViewFactory.updateActivity(binding)
        PermissionsManagerAPI.updateActivity(binding)
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        onAttachedToActivity(binding)
    }

    override fun onDetachedFromActivity() {
        PreviewViewFactory.updateActivity(null)
        PermissionsManagerAPI.updateActivity(null)
    }

    override fun onDetachedFromActivityForConfigChanges() {
        onDetachedFromActivity()
    }
}
