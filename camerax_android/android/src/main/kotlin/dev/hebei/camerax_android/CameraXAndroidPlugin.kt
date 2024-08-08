package dev.hebei.camerax_android

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

/** CameraXAndroidPlugin */
class CameraXAndroidPlugin : FlutterPlugin, ActivityAware {
    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        val registry = binding.platformViewRegistry
        registry.registerViewFactory("hebei.dev/PreviewView", MyPreviewView.MyFactory)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        MyPermissionsManager.onAttachedToActivity(binding)
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        onAttachedToActivity(binding)
    }

    override fun onDetachedFromActivity() {
        MyPermissionsManager.onDetachedFromActivity()
    }

    override fun onDetachedFromActivityForConfigChanges() {
        onDetachedFromActivity()
    }
}
