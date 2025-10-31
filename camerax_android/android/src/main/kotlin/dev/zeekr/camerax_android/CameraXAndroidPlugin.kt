package dev.zeekr.camerax_android

import dev.zeekr.camerax_android.common.PermissionManager
import dev.zeekr.camerax_android.common.ViewFactory
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

/** CameraXAndroidPlugin */
class CameraXAndroidPlugin : FlutterPlugin, ActivityAware {
    private lateinit var registrar: CameraXRegistrarImpl

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        val binaryMessenger = binding.binaryMessenger
        val context = binding.applicationContext
        registrar = CameraXRegistrarImpl(binaryMessenger, context)
        registrar.setUp()
        val viewRegistry = binding.platformViewRegistry
        val viewTypeId = "camerax.zeekr.dev/PreviewView"
        val viewFactory = ViewFactory(registrar.instanceManager)
        viewRegistry.registerViewFactory(viewTypeId, viewFactory)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        registrar.tearDown()
        registrar.instanceManager.stopFinalizationListener()
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        PermissionManager.onAttachedToActivity(binding)
        registrar.onAttachedToActivity(binding)
    }

    override fun onDetachedFromActivityForConfigChanges() {
        PermissionManager.onDetachedFromActivityForConfigChanges()
        registrar.onDetachedFromActivityForConfigChanges()
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        PermissionManager.onReattachedToActivityForConfigChanges(binding)
        registrar.onReattachedToActivityForConfigChanges(binding)
    }

    override fun onDetachedFromActivity() {
        PermissionManager.onDetachedFromActivity()
        registrar.onDetachedFromActivity()
    }
}
