package dev.hebei.camerax_android

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.core.PermissionManager
import dev.hebei.camerax_android.legacy.view.ViewFactory
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

/** CameraXAndroidPlugin */
class CameraXAndroidPlugin : FlutterPlugin, ActivityAware {
    private lateinit var registrar: CameraXRegistrar

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        registrar = CameraXRegistrar(binding.applicationContext, binding.binaryMessenger)
        registrar.setUp()
        val viewFactory = ViewFactory(registrar.instanceManager)
        binding.platformViewRegistry.registerViewFactory(
            "camerax.hebei.dev/PreviewView", viewFactory
        )
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        registrar.tearDown()
        registrar.instanceManager.stopFinalizationListener()
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        PermissionManager.onAttachedToActivity(binding)
        registrar.activity = binding.activity
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        onAttachedToActivity(binding)
    }

    override fun onDetachedFromActivity() {
        PermissionManager.onDetachedFromActivity()
        registrar.activity = null
    }

    override fun onDetachedFromActivityForConfigChanges() {
        onDetachedFromActivity()
    }
}
